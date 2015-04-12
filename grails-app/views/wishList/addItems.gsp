<g:each in="${selectedItems}" status="i" var="item">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${item.id}">${fieldValue(bean: item, field: "meliId")}</g:link></td>

						<td>${fieldValue(bean: item, field: "title")}</td>

						<td><g:img uri="${fieldValue(bean: item, field: "thumbnail")}"></g:img></td>

                        <td>${fieldValue(bean: item, field: "price")}</td>

					</tr>
				</g:each>