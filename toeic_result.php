/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */
<?
$filename = 'test.txt'; //The file must be created with the good rights before using this script.
$somecontent = $_GET['lastName'] . ';' . $_GET['name'] . ';' . $_GET['mail'] . ';' . $_GET['score'] . "\n";

if (is_writable($filename)) {
    if (!$handle = fopen($filename, 'a')) {
        exit;
    }
    if (fwrite($handle, $somecontent) === FALSE) {
        exit;
    }
    fclose($handle);
}
?>