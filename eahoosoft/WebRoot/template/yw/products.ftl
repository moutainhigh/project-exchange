<#include "/head.ftl"/>
							<table width="100%" cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td align="center">
											<table width="85%" cellspacing="0" cellpadding="0" border="0">
												<tbody>
													<tr>
														<td>
			<ul class="pro_list">
				<#list proList as p>
				<li>
					<a target="_blank" href="product_${p.id}.html">
						<img width="140" class="ProductPhoto" style="border:1px solid #000000" src="productpic/${p.name}.jpg">
					</a>
					<br/>
					<a class="link12_c" target="_blank" href="product_${p.id}.html">${p.name}</a>
				</li>
				</#list>
			</ul>
			<div style="clear:both;"></div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
<#include "/foot.ftl"/>