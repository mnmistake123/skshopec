{foreach $list as $product}
    <tr>
        <td style="padding: 10px 0;" width="18%">
            <p style="margin: 0; padding: 0 5px;">{$product['reference']}</p>
        </td>
        <td style="padding: 10px 0;" width="37%">
            <p class="name-product" style="margin: 0; padding: 0 5px; font-weight: bold;">{$product['name']}
                {if count($product['customization']) == 1}
                    {foreach $product['customization'] as $customization}
                        <span style="font-weight: normal; display: block;">{$customization['customization_text']}</span>
                    {/foreach}
                {/if}
            </p>
            {hook h='displayProductPriceBlock' product=$product type="unit_price"}
        </td>
        <td style="padding: 10px 0;" width="15%">
            <p style="margin: 0; padding: 0 5px;">{$product['unit_price']}</p>
        </td>
        <td style="padding: 10px 0;" width="15%">
            <p style="margin: 0; padding: 0 5px;">{$product['quantity']}</p>
        </td>
        <td align="right" style="padding: 10px 0;" width="15%">
            <p style="margin: 0; padding: 0 5px;">{$product['price']}</p>
        </td>
    </tr>
    {if count($product['customization']) > 1}
        {foreach $product['customization'] as $customization}
            <tr>
                <td colspan="3" style="padding: 10px 0;">
                    <p style="margin: 0; padding: 0;">{$customization['customization_text']}</p>
                </td>
                <td colspan="2" align="left" style="padding: 10px 0;">
                    {if count($product['customization']) > 1}
                        <p style="margin: 0; padding: 0; text-align: left">{$customization['customization_quantity']}</p>
                    {/if}
                </td>
            </tr>
        {/foreach}
    {/if}
{/foreach}
