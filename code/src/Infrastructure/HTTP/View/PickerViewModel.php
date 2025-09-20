<?php

namespace songguessr\Infrastructure\HTTP\View;

use songguessr\Domain\Model\PickerModel;

class PickerViewModel implements ViewModel
{
    private function __construct(private PickerModel $pickerModel)
    {
    }

    public static function fromPickerModel(PickerModel $pickerModel): PickerViewModel
    {
        return new PickerViewModel($pickerModel);
    }

    public function jsonSerialize(): array
    {
        return [
            'id' => $this->pickerModel->getId(),
            'firstName' => $this->pickerModel->getFirstName(),
            'lastName' => $this->pickerModel->getLastName(),
        ];
    }
}