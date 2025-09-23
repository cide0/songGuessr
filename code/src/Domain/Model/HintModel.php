<?php

namespace songguessr\Domain\Model;

class HintModel
{
    private int $id;
    private string $type;
    private int $songId;
    private int $sequence;
    private ?string $contentReplaceOne;

    public function __construct(array $data) {
        $this->id = $data['hint_id'];
        $this->type = $data['type'];
        $this->songId = $data['song_id'];
        $this->sequence = $data['sequence'];
        $this->contentReplaceOne = $this->extractContentReplaceOne($data);
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function getSongId(): int
    {
        return $this->songId;
    }

    public function getSequence(): int
    {
        return $this->sequence;
    }

    public function getContentReplaceOne(): ?string
    {
        return $this->contentReplaceOne;
    }

    private function extractContentReplaceOne(array $data): ?string
    {
        if(isset($data['content_replace_1'])) {
            return $data['content_replace_1'];
        }

        return null;
    }
}