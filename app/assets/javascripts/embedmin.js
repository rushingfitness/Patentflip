!function(){var embedTag,tags=document.getElementsByTagName("script"),placeHolder=document.createElement("div");for(var i=0;i<tags.length;i++){if(tags[i].innerHTML.indexOf("<video")!==-1){embedTag=tags[i];embedTag.parentNode.insertBefore(placeHolder,embedTag);embedTag.parentNode.removeChild(embedTag);break}}var head=document.getElementsByTagName("head")[0],BASE="//releases.flowplayer.org/5.4.1/commercial",JS=embedTag.getAttribute("data-library")||BASE+"/flowplayer.min.js",SWF=embedTag.getAttribute("data-swf")||BASE+"/flowplayer.swf",CSS=embedTag.getAttribute("data-skin")||BASE+"/skin/minimalist.css",GA="//www.google-analytics.com/ga.js",JQUERY="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js";function loadJS(test,path,callback){if(test)return callback(test);var el=document.createElement("script");el.onload=el.onreadystatechange=function(){var s=el.readyState;if(s===undefined||/complete|loaded/.test(s)){return callback()}};el.async=true;el.src=path;head.insertBefore(el,head.firstChild)}function loadCSS(path){var el=document.createElement("link");el.rel="stylesheet";el.type="text/css";el.href=path;head.insertBefore(el,head.firstChild)}var jQueryVersion=typeof jQuery!="undefined"?parseFloat(jQuery().jquery):0;var needNoConflict=typeof $!="undefined"&&jQuery!=$;loadJS(jQueryVersion>=1.7,JQUERY,function(found){var $;if(!found&&needNoConflict){$=jQuery.noConflict()}var removeJQueryVariable=!found&&jQueryVersion!==0;loadJS(typeof _gat!="undefined",GA,function(){loadJS(typeof flowplayer!="undefined",JS,function(found){if(!found)loadCSS(CSS);$=$||jQuery;var tag=$(embedTag),src=tag.attr("src"),player=$(tag.html().replace(/^[ \t\n\r]+/gm,"").replace(/[ \n\t\r]+$/gm,""));$(placeHolder).replaceWith(player);player.find(":not(video, source)").remove();player.flowplayer({swf:SWF,e:1});player.data("flowplayer").conf.embed={library:JS,swf:SWF,script:src};removeJQueryVariable&&$.noConflict(true)})})})}();
