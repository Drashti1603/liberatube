<?php
    include('../config.php');
    header('Content-Type: video/mp4');
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
        $link = "https";
    else $link = "http";
    $link .= "://";
    $link .= $_SERVER['HTTP_HOST'];
    $link .= $_SERVER['REQUEST_URI'];
$url = $link;
$url_components = parse_url($url);
parse_str($url_components['query'], $params);
if ($params['dl'] == "true") {
    $url = $InvVDServer1."/latest_version?id=" . $params['id'] . "&itag=18";
    readfile($url);
    exit();
}
else {
    header('Location: '.$InvVDServer1.'/latest_version?id=' . $params['id'] . '&itag=18');
}
exit;
?>