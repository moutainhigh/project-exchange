	      <div id="guideContents">
	        <div>
	          <ul>
	            <li class="listTitle">
	              <h3>User Guide</h3>
	            </li>
	            <#list glList as g>
	            <li><a href="guide/${g.fileName}">${g.linkName}</a></li>
	            </#list>
	            <#list grList as g>
	            <li><a href="guide/${g.fileName}">${g.linkName}</a></li>
	            </#list>
	            <li><a href="${appPath}guide.html" class="nav-more">&gt;&gt; Learn More</a></li>
	          </ul>
	        </div>
	      </div>