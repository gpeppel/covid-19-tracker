<?php
// ═══════════════════════════════════════════════════════════════════════════════╡
// FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════╡
function pv($var)
{
	echo '<pre>';
	var_dump($var);
	echo '</pre>';
}

function da($arr)
{
	// $rtn = array();
	foreach ($arr as $key => $value) {
		if (is_array($value)) {
			da($value);
		} else {
			// $rtn[$key] = $value;
			echo "Key: $key; Value: $value<br />\n";
		}
	}
	// return $rtn;
}

function DB_connect()
{
	$cnx = new mysqli('vm', 'greg', 'greg', 'covid19');

	if ($cnx->connect_error) {
		die('Connection failed: ' . $cnx->connect_error);
		exit;
	} else {
		echo "";
		return $cnx;
	}
}

// ═══════════════════════════════════════════════════════════════════════════════╡
// DELTA UPDATE FUNCTION
// ═══════════════════════════════════════════════════════════════════════════════╡
function check_delta_update()
{
	$cnx = new mysqli('vm', 'greg', 'greg', 'covid19');
	if ($cnx->connect_error) {
		die('Connection failed: ' . $cnx->connect_error);
	}
	$query = 'WITH States AS (
                SELECT StateID, SUM(LastUpdated) AS LastUpdated FROM States
                WHERE StateID = 1
                GROUP BY 1),
             StatesOld AS (
                SELECT StateID, SUM(LastUpdated) AS LastUpdated FROM StatesOld
                WHERE StateID = 1
                GROUP BY 1)
             SELECT
                s.StateID, s.LastUpdated AS States, o.LastUpdated AS StatesOld,
                CASE WHEN o.LastUpdated < s.LastUpdated THEN s.LastUpdated - o.LastUpdated ELSE 0 END AS total
            FROM States s
            JOIN StatesOld o ON o.StateID = s.StateID';
	$cursor = $cnx->query($query);
	$cnx->close();
	$row = $cursor->fetch_assoc();
	return $row;
}

// ═══════════════════════════════════════════════════════════════════════════════╡
// DELTA CALCULATION FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════╡
function get_new_case_deltas()
{	
	$update = check_delta_update();
	$c_array = array();
	$cnx = new mysqli('vm', 'greg', 'greg', 'covid19');
	if ($cnx->connect_error) {
		die('Connection failed: ' . $cnx->connect_error);
	}
	$query = 'SELECT a.StateName
                        , a.current_total
                        , b.old_total
                        , a.current_total - b.old_total AS difference
                    FROM (SELECT StateName, SUM(ConfirmedCases) AS current_total FROM States
                    GROUP BY StateName ) AS a
                        LEFT OUTER JOIN (SELECT StateName, SUM(ConfirmedCases) AS old_total FROM StatesOld
                    GROUP BY StateName ) AS b
                        ON b.StateName = a.StateName';
	$cursor = $cnx->query($query);
	while ($row = $cursor->fetch_row()) {
		$c_array[$row[0]] = $row[3];
	}

	$cnx->close();
	return $c_array;
	
}

function get_new_death_deltas()
{
	$update = check_delta_update();
	$d_array = array();
	$cnx = new mysqli('vm', 'greg', 'greg', 'covid19');
	if ($cnx->connect_error) {
		die('Connection failed: ' . $cnx->connect_error);
	}
	$query = 'SELECT a.StateName
                        , a.new_death_total
                        , b.old_death_total
                        , a.new_death_total - b.old_death_total AS difference
                    FROM (SELECT StateName, SUM(ConfirmedDeaths) AS new_death_total FROM States
                    GROUP BY StateName ) AS a
                        LEFT OUTER JOIN (SELECT StateName, SUM(ConfirmedDeaths) AS old_death_total FROM StatesOld
                    GROUP BY StateName ) AS b
                        ON b.StateName = a.StateName';
	$cursor = $cnx->query($query);
	$x = 0;
	while ($row = $cursor->fetch_row()) {
		$d_array[$row[0]] = $row[3];
	}
	$cnx->close();
	return $d_array;
}
// ═══════════════════════════════════════════════════════════════════════════════╡
// MASTHEAD TOTALS
// ═══════════════════════════════════════════════════════════════════════════════╡
function get_totals()
{
	$cnx = DB_connect();
	$p = 0;
	$query = 'SELECT Cases, Deaths FROM Country';
	$cursor = $cnx->query($query);
	while ($row = $cursor->fetch_row()) {
		$result = $row;
	}
	echo '<div class="mast-row">';
	echo '<h2>' . "Total Cases: " . $result[0] . '</h2>';
	echo '<h2>' . "Total Deaths: " . $result[1] . '</h2>';
	echo '</div>';


	$cnx->close();
}

// ═══════════════════════════════════════════════════════════════════════════════╡
// GET USER IP ADDRESS
// ═══════════════════════════════════════════════════════════════════════════════╡
function get_user_ip()
{
	if (!empty($_SERVER['HTTP_CLIENT_IP']))
	{
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
	{
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = $_SERVER['REMOTE_ADDR'];
	}
	return $ip;
}
