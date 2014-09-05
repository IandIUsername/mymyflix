
require 'spec_helper'

feature 'user interacts with the queue' do
  scenario 'user adds and reorders videos in the queue' do
    comedies = Fabricate(:category)
    monk = Fabricate(:video, title: 'Monk', category: comedies)
    south_park = Fabricate(:video, title: 'South Park', category: comedies)
    futurama = Fabricate(:video, title: 'Futurama', category: comedies)
    
    sign_in
    
     add_video_to_queue(monk)
    expect_video_to_be_in_queue(monk)
    expect_link_not_to_be_seen("+ My Queue")
    
     add_video_to_queue(south_park)
     add_video_to_queue(futurama)
    
     set_video_position(monk, 3)
     set_video_position(south_park, 1)
     set_video_position(futurama, 2)
    
    update_queue("submit")
    
     expect_video_position(south_park, 1)
     expect_video_position(futurama, 2)
     expect_video_position(monk, 3)
    
    
#     find("a[href='/videos/#{monk.id}']").click
#     page.should have_content(monk.title)
    
#     click_link "+ My Queue"
#     page.should have_content(monk.title)
    
#     visit video_path(monk)
#     page.should_not have_content "+ My Queue"
    
#     visit my_queue_path
#     click_link "Remove"
    
#     visit home_path
#     find("a[href='/videos/#{monk.id}']").click
#     click_link "+ My Queue"
#     visit home_path
#     find("a[href='/videos/#{south_park.id}']").click
#     click_link "+ My Queue"
#     visit home_path
#     find("a[href='/videos/#{futurama.id}']").click
#     click_link "+ My Queue"
    
    #witihin(:xpath, "//tr[contains(.,'#{monk.title}")
    #fill_in "queue_items[][position]" with: 3
    #witihin(:xpath, "//tr[contains(.,'#{south_park.title}")
    #fill_in "queue_items[][position]" with: 2
    #within(:xpath, "//tr[contains(.,'#{futurama.id}")
    #fill_in "queue_items[][position]" with: 1
    
    
    #find("input[data-video-id='#{monk.id}").set(3)
    #find("input[data-video-id='#{southPark.id}").set(1)
    #find("input[data-video-id='#{futurama.id}").set(2)
    
    #set_video_position(monk, 3)
    #set_video_position(south_park, 1)
    #set_video_position(futurama, 3)
    
#     expect_video_position(monk, 3)
#     expect_video_position(south_park, 1)
#     expect_video_position(futurama, 3)
 

end
end

def update_queue(x)
  click_button x
end

  def expect_video_to_be_in_queue(video)
    page.should have_content(video.title)
    puts "#{video.title}"
  end

def expect_link_not_to_be_seen(link_text)
  page.should_not have_content(link_text)
end

    def expect_video_position(video, position)
      expect(find(:xpath, "//tr[contains(.,'#{video.title}')]//input[@type='text']").value).to eq(position.to_s)
    end
    
    def set_video_position(video, position)
      within(:xpath, "//tr[contains(.,'#{video.title}')]") do
    fill_in "queue_items[][position]", with: position
    end
    end
    
    def add_video_to_queue(video)
      visit home_path
      find("a[href='/videos/#{video.id}']").click
      click_link "+ My Queue"
    end
    
#     fill_in "video_#{monk.id}", with: 3
#     fill_in "video_#{south_park.id}", with: 1
#     fill_in "video_#{futurama.id}", with: 2
    
#     click_button "submit"
#     #expect(find("input[data-video-id='#{monk.id}']").value).to eq(3)
#     #expect(find("input[data-vieo-id='#{south_park.id}']").value).to eq(1)
#     #expect(find("input[data-video-id='#{futurama.id}']").value).to eq(2)
#     expect(find("#video_#{south_park.id}").value).to eq("1")
#     expect(find("#video_#{futurama.id}").value).to eq("2")
#     expect(find("#video_#{monk.id}").value).to eq("3")
    
# end
# end