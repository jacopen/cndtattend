if ENV['REVIEW_APP'] == 'true'
  csv = CSV.read(File.join(Rails.root, 'db/talks.csv'), headers: true)
  Talk.seed(csv.map(&:to_hash))

  csv = CSV.read(File.join(Rails.root, 'db/speakers.csv'), headers: true)
  Speaker.seed(csv.map(&:to_hash))

  csv = CSV.read(File.join(Rails.root, 'db/talks_speakers.csv'), headers: true)
  TalksSpeaker.seed(csv.map(&:to_hash))
end

Sponsor.seed(
  {
    id: 1,
    name: "ibm",
    conference_id: 1,
    url: "https://www.ibm.com/jp-ja/cloud/cloud-native"
  },
  {
    id: 2,
    name: "redhat",
    conference_id: 1,
    url: "https://www.redhat.com/ja/global/japan#links"
  },
  {
    id: 3,
    name: "jfrog",
    conference_id: 1,
    url: "https://jfrog.co.jp/"
  },
  {
    id: 4,
    name: "NewRelic",
    conference_id: 1,
    url: "https://newrelic.co.jp/"
  },
  {
    id: 5,
    name: "circleci",
    conference_id: 1,
    url: "https://circleci.com/ja/"
  },
  {
    id: 6,
    name: "nginx",
    conference_id: 1,
    url: "https://www.nginx.co.jp/"
  },
  {
    id: 7,
    name: "Oracle",
    conference_id: 1,
    url: "https://www.oracle.com/jp/index.html"
  },
  {
    id: 8,
    name: "microsoft",
    conference_id: 1,
    url: "https://news.microsoft.com/ja-jp/"
  },
  {
    id: 9,
    name: "cyberagent",
    conference_id: 1,
    url: "https://developers.cyberagent.co.jp/"
  },
  {
    id: 10,
    name: "fujitsu",
    conference_id: 1,
    url: "https://www.fujitsu.com/jp/"
  },
  {
    id: 11,
    name: "sios",
    conference_id: 1,
    url: "https://sios.jp/"
  },
  {
    id: 12,
    name: "nttdata",
    conference_id: 1,
    url: "https://www.nttdata.com/jp/ja/"
  },
  {
    id: 13,
    name: "casareal",
    conference_id: 1,
    url: "https://www.casareal.co.jp/"
  },
  {
    id: 14,
    name: "hatena",
    conference_id: 1,
    url: "https://mackerel.io"
  },
  {
    id: 15,
    name: "sysdig",
    conference_id: 1,
    url: "https://sysdig.jp"
  },
  {
    id: 16,
    name: "canonical",
    conference_id: 1,
    url: "https://jp.ubuntu.com/"
  },
  {
    id: 17,
    name: "pepabo",
    conference_id: 1,
    url: "https://pepabo.com/"
  },
  {
    id: 18,
    name: "kuroco",
    conference_id: 1,
    url: "https://kuroco.app/"
  },
  {
    id: 19,
    name: "google",
    conference_id: 1,
    url: 'https://cloud.google.com/anthos'
  },
  {
    id: 20,
    name: 'legalforce',
    conference_id: 1,
    url: 'https://www.legalforce.co.jp/'
  },
  {
    id: 21,
    name: 'suse',
    conference_id: 1,
    url: 'https://www.suse.com/ja-jp/solutions/devops/'
  },
  {
    id: 22,
    name: 'vmware',
    conference_id: 1,
    url: 'https://www.vmware.com/jp.html'
  },
  )

SponsorType.seed(
  { id: 1,
    conference_id: 1,
    name: "Diamond",
    order: 1,
  },
  { id: 2,
    conference_id: 1,
    name: "Platinum",
    order: 2,
  },
  { id: 3,
    conference_id: 1,
    name: "Gold",
    order: 3,
  },
  { id: 4,
    conference_id: 1,
    name: "Mini Session",
    order: 5,
  },
  { id: 5,
    conference_id: 1,
    name: "Booth",
    order: 4,
  },
  { id: 6,
    conference_id: 1,
    name: "CM",
    order: 6,
  }
)

[
  [1, 'Diamond', 'ibm'],
  [2, 'Diamond', 'redhat'],
  [3, 'Diamond', 'jfrog'],
  [4, 'Diamond', 'NewRelic'],
  [5, 'Platinum', 'circleci'],
  [6, 'Platinum', 'nginx'],
  [7, 'Platinum', 'oracle'],
  [8, 'Platinum', 'microsoft'],
  [9, 'Platinum', 'google'],
  [10, 'Platinum', 'legalforce'],
  [11, 'Platinum', 'suse'],
  [12, 'Platinum', 'vmware'],
  [13, 'Gold', 'cyberagent'],
  [14, 'Gold', 'fujitsu'],
  [15, 'Gold', 'sios'],
  [16, 'Gold', 'nttdata'],
  [17, 'Gold', 'casareal'],
  [18, 'Gold', 'hatena'],
  [19, 'Gold', 'sysdig'],
  [20, 'Booth', 'canonical'],
  [21, 'Booth', 'circleci'],
  [22, 'Booth', 'nginx'],
  [23, 'Booth', 'ibm'],
  [24, 'Booth', 'pepabo'],
  [25, 'Booth', 'legalforce'],
  [26, 'Mini Session', 'ibm'],
  [27, 'CM', 'canonical'],
  [28, 'CM', 'ibm'],
  [29, 'CM', 'kuroco'],
  [30, 'CM', 'fujitsu']
].each do |sponsors_sponsor_type|
  id = sponsors_sponsor_type[0]
  sponsor_type = SponsorType.find_by(name: sponsors_sponsor_type[1])
  sponsor = Sponsor.find_by(name: sponsors_sponsor_type[2])
  SponsorsSponsorType.seed({id: id, sponsor_type_id: sponsor_type.id, sponsor_id: sponsor.id})
end

[
  [1, 'canonical', 'sponsors/canonical.png'],
  [2, 'casareal', 'sponsors/casareal.png'],
  [3, 'circleci', 'sponsors/circleci.png'],
  [4, 'cyberagent', 'sponsors/cyberagent.png'],
  [5, 'kuroco', 'sponsors/diverta.png'],
  [6, 'nginx', 'sponsors/f5.jpg'],
  [7, 'fujitsu', 'sponsors/fujitsu.png'],
  [8, 'pepabo', 'sponsors/gmo-pepabo.png'],
  [9, 'google', 'sponsors/google.png'],
  [10, 'hatena', 'sponsors/hatena.png'],
  [11, 'ibm', 'sponsors/ibm.jpg'],
  [12, 'jfrog', 'sponsors/jfrog.png'],
  [13, 'legalforce', 'sponsors/legalforce.png'],
  [14, 'microsoft', 'sponsors/microsoft.png'],
  [15, 'nttdata', 'sponsors/nttdata.png'],
  [16, 'oracle', 'sponsors/oracle.png'],
  # [17, 'rancherlabs', 'sponsors/rancherlabs.png'],
  [18, 'redhat', 'sponsors/redhat.png'],
  [19, 'sios', 'sponsors/sios.png'],
  [20, 'sysdig', 'sponsors/sysdig.png'],
  [21, 'NewRelic', 'sponsors/newrelic.png'],
  [22, 'suse', 'sponsors/suse.png'],
  [23, 'vmware', 'sponsors/vmware.png'],
].each do |logo|
  SponsorAttachment.seed(
    { id: logo[0],
      sponsor_id: Sponsor.find_by(name: logo[1]).id,
      type: 'SponsorAttachmentLogoImage',
      url: logo[2]
    }
  )
end