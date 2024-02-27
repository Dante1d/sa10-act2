class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
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

  def quality
    return item.quality if item
    @quality
  end

  def days_remaining
    return items.days_remaining if item
    @days_remaining
  end


  def tick
    case name
    when "Normal Item"
      return normal_tick
    when "Aged Brie"
      return brie_tick
    when "Sulfuras, Hand of Ragnaros"
      return sulfuras_tick
    when "Backstage passes to a TAFKAL80ETC concert"
      return backstage_tick
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
