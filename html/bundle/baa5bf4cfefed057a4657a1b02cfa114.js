ace.define("ace/mode/plain_text",["require","exports","module","ace/lib/oop","ace/mode/text","ace/mode/text_highlight_rules","ace/mode/behaviour"],(function(e,t,i){"use strict";var o=e("../lib/oop"),u=e("./text").Mode,h=e("./text_highlight_rules").TextHighlightRules,n=e("./behaviour").Behaviour,l=function(){this.HighlightRules=h,this.$behaviour=new n};o.inherits(l,u),function(){this.type="text",this.getNextLineIndent=function(e,t,i){return""},this.$id="ace/mode/plain_text"}.call(l.prototype),t.Mode=l})),ace.require(["ace/mode/plain_text"],(function(e){"object"==typeof module&&"object"==typeof exports&&module&&(module.exports=e)}));