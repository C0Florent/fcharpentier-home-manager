{ lib, ... }:

let
  attrsToListRec = attrSet:
    builtins.concatMap (x:
      if builtins.isAttrs x && !lib.isDerivation x
        then attrsToListRec x
        else [x]
    )
    (builtins.attrValues attrSet)
  ;
in {
  inherit attrsToListRec;
}
