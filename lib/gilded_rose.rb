module GildedRose
  def self.new(name:, days_remaining:, quality:)
    @item = klass_for(name).new(quality, days_remaining)
  end

  def self.klass_for(name)
    case name
    when "Normal Item"
      Normal
    when "Aged Brie"
      Brie
    when "Sulfuras, Hand of Ragnaros"
      Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Backstage
    end
  end

  def tick
    item.tick
  end

  def quality
    item.quality
  end

  def days_remaining
    items.days_remaining
  end

  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

  def normal_tick
    @item = Normal.new(quality, days_remaining)
    item.tick
  end

  def brie_tick
    @item = Brie.new(quality, days_remaining)
    item.tick
  end

  def sulfuras_tick
    @item = Sulfuras.new(quality, days_remaining)
    item.tick
  end

  def backstage_tick
    @item = Backstage.new(quality, days_remaining)
    item.tick
  end


    # if name == "Normal Item"
    #   return normal_tick
    # end

    if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        @quality = @quality + 1
        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end
    if @name != "Sulfuras, Hand of Ragnaros"
      @days_remaining = @days_remaining - 1
    end
    if @days_remaining < 0
      if @name != "Aged Brie"
        if @name != "Backstage passes to a TAFKAL80ETC concert"
          if @quality > 0
            if @name != "Sulfuras, Hand of Ragnaros"
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end
  end

  def normal_tick
    @days_remaining -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end

  def brie_tick
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining <= 0 && @quality < 50
  end

  def sulfuras_tick
  end

  def backstage_tick
    @days_remaining -= 1
    return if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
  end

  # def normal_tick
  #   if @quality != 0
  #     if days_remaining > 0
  #       @quality -= 1
  #     end
  #     if @days_remaining <= 0
  #       @quality -= 2
  #     end
  #   end
  #   @days_remaining -= 1
  # end
end
