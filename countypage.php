<?php $pg = basename(substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '.')));
$page = "countypage";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include 'includes/head.php'; ?>
</head>

<body>
    <?php include 'includes/deltas.php';?>
    <?php include 'includes/masthead.php'; ?>
    <?php include 'includes/countyboard.php'; ?>
    <?php include 'includes/scripts.php'; ?>
    <?php include 'includes/footer.php'; ?>
</body>

</html>