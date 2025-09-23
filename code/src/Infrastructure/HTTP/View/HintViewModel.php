<?php

namespace songguessr\Infrastructure\HTTP\View;

use songguessr\Domain\Model\HintModel;

class HintViewModel implements ViewModel
{
    private function __construct(private HintModel $hintModel)
    {
    }

    public static function fromHintModel(HintModel $hintModel): HintViewModel
    {
        return new HintViewModel($hintModel);
    }

    public function jsonSerialize(): array
    {
        return [
            'id' => $this->hintModel->getId(),
            'type' => $this->hintModel->getType(),
            'songId' => $this->hintModel->getSongId(),
            'sequence' => $this->hintModel->getSequence(),
            'contentReplaceOne' => $this->hintModel->getContentReplaceOne()
        ];
    }
}