<div id="temp">
    <ul>
        <g:each in="${itemsS}" status="index" var="item">
            <li>
                <g:formRemote name="myForm" on404="alert('not found!')" update="itemsAdded"
                              url="[controller: 'wishList', action:'addItems']">
                    <g:img uri="${item.thumbnail}" ></g:img>
                    <h1>$${item.price}</h1>
                    <h1>${item.title}</h1>
                    <input type="hidden" name="itemId" value=${item.meliId}>
                    <input type="hidden" name="items" value=${itemsS}>
                    <Button type="submit" onclick="clearBox('updateMe')">Seleccionar</Button>
                </g:formRemote>
            </li>
        </g:each>
    </ul>
</div>