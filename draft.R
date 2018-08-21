url <- 'http://read.taaze.tw/cwr/pdf_new.php?t=HoqOe3qdfWoncp_7NfDgkEphT3muwrCFPMcYLG2fWlkat7KUCPZL7Gf7NQIrT5h8xDRAl6KSVZPX20Qz49p66-FVUxyfYfqZb7O56zqR0IS6shhh1iYpE1lVqyw4v5jo6IetZXOHtaR9C46RlTqDwSV-BTg9yL_KzbdKbDVIfrGFw2Kf5sacqqiuEwJkRYcQ4klWmkmgmcCmYROFA7ZiCpWQWLo_RexFqwb1QFQA8nnavtAJL-_aHTCJpi9yd2I8'

## source files of the pdf document in image format but mosaiced.
## https://s3-ap-northeast-1.amazonaws.com/taaze/pimages/14100027802/L/141000278020001.png
## 

library('webshot')
webshot::install_phantomjs()
webshot(url, file = 'r.pdf', selector = '#content', 
        eval = "casper.then(function() {
        // Check the remember me box
        this.click('#view');

        // Enter username and password
        //this.sendKeys('#login_login-main input[type=\"text\"]', 'my_username');
        //this.sendKeys('#login_login-main input[type=\"password\"]', 'password');
        
        // Now click in the search box. This results in a box expanding below
        //this.click('#search input[type=\"text\"]');
        
        // Wait 500ms
        this.wait(500);
        });")






