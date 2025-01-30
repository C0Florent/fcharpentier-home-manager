rec {
  attrsToListRec = attrSet:
    builtins.concatMap x:
      if builtins.isAttrs x
        then attrsToListRec x
        else [x]
    (builtins.attrValues attrSet)
  ;
}
