// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Primero importamos algunos contratos de OpenZeppelin.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// Heredamos el contrato que importamos. Esto significa que tendremos acceso
// a los métodos del contrato heredado.
contract MyEpicNFT is ERC721URIStorage {
  // Magia que nos ha dado OpenZeppelin para ayudarnos a realizar un seguimiento de tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // Necesitamos pasar el nombre de nuestro token NFT y su símbolo.
  constructor() ERC721 ("Matriz-NFT", "Matriz") {
    console.log("Este es nuestro contrato NFT. Woah!");
  }

  // Una función que nuestro usuario golpeará para obtener su NFT.
  function makeAnEpicNFT() public {
  // Obtenga el tokenId actual, esto comienza en 0.
    uint256 newItemId = _tokenIds.current();

  // En realidad acuñar el NFT al remitente usando msg.sender.
    _safeMint(msg.sender, newItemId);

  // Establecer los datos de NFT.
    _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiRXBpY0xvcmRIYW1idXJnZXIiLAogICAgImRlc2NyaXB0aW9uIjogIkFuIE5GVCBmcm9tIHRoZSBoaWdobHkgYWNjbGFpbWVkIHNxdWFyZSBjb2xsZWN0aW9uIiwKICAgICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhkb2FYUmxPeUJtYjI1MExXWmhiV2xzZVRvZ2MyVnlhV1k3SUdadmJuUXRjMmw2WlRvZ01UUndlRHNnZlR3dmMzUjViR1UrQ2lBZ0lDQThjbVZqZENCM2FXUjBhRDBpTVRBd0pTSWdhR1ZwWjJoMFBTSXhNREFsSWlCbWFXeHNQU0ppYkdGamF5SWdMejRLSUNBZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU5UQWxJaUJqYkdGemN6MGlZbUZ6WlNJZ1pHOXRhVzVoYm5RdFltRnpaV3hwYm1VOUltMXBaR1JzWlNJZ2RHVjRkQzFoYm1Ob2IzSTlJbTFwWkdSc1pTSStSWEJwWTB4dmNtUklZVzFpZFhKblpYSThMM1JsZUhRK0Nqd3ZjM1puUGc9PSIKfQ=="); //aqui esta la metadata 
    
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // Incrementa el contador para cuando se acuña el próximo NFT.
    _tokenIds.increment();
  }
  
}

