<div id="county">
    <h1 style="margin-top:30px; color: gray;">California Counties</h1>
    <div class="btn-group" style="display: inline-block; margin-top:20px;">
        <button class="button" style="vertical-align:middle"><span>County Name</span></button>
        <button class="button" style="vertical-align:middle"><span>Cases</span></button>
        <button class="button" style="vertical-align:middle"><span>Deaths</span></button>
    </div>
</div>
<div class="container-table100">
    <div class="wrap-table200">
        <div class="table">
            <?php
            $cnx = DB_connect();
            $query = "SELECT * FROM County";
            $cursor = $cnx->query($query);
            $cnx->close();
            while ($row = $cursor->fetch_assoc()) {
                echo '<div class="row">';
                echo '<div class="cell" data-title="State Name">' . $row['CountyName'] . '</div>';
                echo '<div class="cell" data-title="Confirmed Cases">' . $row['ConfirmedCases'] . '</div>';
                echo '<div class="cell" data-title="Confirmed Deaths">' . $row['ConfirmedDeaths'] . '</div>';
                echo '</div>';
            }
            ?>
        </div>
    </div>
</div>