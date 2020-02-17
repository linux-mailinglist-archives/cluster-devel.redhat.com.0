Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CA91E161811
	for <lists+cluster-devel@lfdr.de>; Mon, 17 Feb 2020 17:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581957384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GiokA8/yPPUynWnswz58HrY9dsDUaFIhkW1ATWHBu+U=;
	b=alhvVKRIuQ9tXI/biaL7NLXztei+5Vk9wfHW95TPb1H88mAwbOWqBRDw0XgDmKP6oaUlqf
	en0ZBh5Y00Qt8073Fjb4tWzfu7xPQf1iq22jR+mglBnvdFnPNMdCFWcpHkMCwVLgBvNh7J
	DgKoWpdvMunGfHH63IzwsWVEa/A9xvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-11mdg3PtP3-aO7psGydorw-1; Mon, 17 Feb 2020 11:36:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4960190B2A8;
	Mon, 17 Feb 2020 16:36:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9702385748;
	Mon, 17 Feb 2020 16:36:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEA2035B02;
	Mon, 17 Feb 2020 16:36:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HGVIdb016187 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 11:31:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4EB732166B2E; Mon, 17 Feb 2020 16:31:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9922166B2B
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A377C8026FE
	for <cluster-devel@redhat.com>; Mon, 17 Feb 2020 16:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-3_9DnQ3aO9imFn9RfLlhIA-1; Mon, 17 Feb 2020 11:31:13 -0500
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189]
	helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3j0c-0006ud-6y; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1j3j0Z-000fYx-H7; Mon, 17 Feb 2020 17:12:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 17 Feb 2020 17:11:46 +0100
Message-Id: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-MC-Unique: 3_9DnQ3aO9imFn9RfLlhIA-1
X-MC-Unique: 11mdg3PtP3-aO7psGydorw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HGVIdb016187
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 17 Feb 2020 11:36:11 -0500
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	linux-mtd@lists.infradead.org, Tyler Hicks <code@tyhicks.com>,
	linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, Chris Mason <clm@fb.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
	Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
	ecryptfs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
	Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-fsdevel@vger.kernel.org,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, Anton Altaparmakov <anton@tuxera.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
	linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Johannes Thumshirn <jth@kernel.org>, linux-erofs@lists.ozlabs.org,
	linux-karma-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 00/44] Manually convert filesystem FS
	documents to ReST
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

There are lots of plain text documents under Documentation/filesystems.

Manually convert several of those to ReST and add them to the index file.

Mauro Carvalho Chehab (44):
  docs: filesystems: convert 9p.txt to ReST
  docs: filesystems: convert adfs.txt to ReST
  docs: filesystems: convert affs.txt to ReST
  docs: filesystems: convert afs.txt to ReST
  docs: filesystems: convert autofs-mount-control.txt to ReST
  docs: filesystems: convert befs.txt to ReST
  docs: filesystems: convert bfs.txt to ReST
  docs: filesystems: convert btrfs.txt to ReST
  docs: filesystems: convert ceph.txt to ReST
  docs: filesystems: convert cramfs.txt to ReST
  docs: filesystems: convert debugfs.txt to ReST
  docs: filesystems: convert dlmfs.txt to ReST
  docs: filesystems: convert ecryptfs.txt to ReST
  docs: filesystems: convert efivarfs.txt to ReST
  docs: filesystems: convert erofs.txt to ReST
  docs: filesystems: convert ext2.txt to ReST
  docs: filesystems: convert ext3.txt to ReST
  docs: filesystems: convert f2fs.txt to ReST
  docs: filesystems: convert gfs2.txt to ReST
  docs: filesystems: convert gfs2-uevents.txt to ReST
  docs: filesystems: convert hfsplus.txt to ReST
  docs: filesystems: convert hfs.txt to ReST
  docs: filesystems: convert hpfs.txt to ReST
  docs: filesystems: convert inotify.txt to ReST
  docs: filesystems: convert isofs.txt to ReST
  docs: filesystems: convert nilfs2.txt to ReST
  docs: filesystems: convert ntfs.txt to ReST
  docs: filesystems: convert ocfs2-online-filecheck.txt to ReST
  docs: filesystems: convert ocfs2.txt to ReST
  docs: filesystems: convert omfs.txt to ReST
  docs: filesystems: convert orangefs.txt to ReST
  docs: filesystems: convert proc.txt to ReST
  docs: filesystems: convert qnx6.txt to ReST
  docs: filesystems: convert ramfs-rootfs-initramfs.txt to ReST
  docs: filesystems: convert relay.txt to ReST
  docs: filesystems: convert romfs.txt to ReST
  docs: filesystems: convert squashfs.txt to ReST
  docs: filesystems: convert sysfs.txt to ReST
  docs: filesystems: convert sysv-fs.txt to ReST
  docs: filesystems: convert tmpfs.txt to ReST
  docs: filesystems: convert ubifs-authentication.rst.txt to ReST
  docs: filesystems: convert ubifs.txt to ReST
  docs: filesystems: convert udf.txt to ReST
  docs: filesystems: convert zonefs.txt to ReST

 Documentation/filesystems/{9p.txt =3D> 9p.rst}  |  114 +-
 .../filesystems/{adfs.txt =3D> adfs.rst}        |   29 +-
 .../filesystems/{affs.txt =3D> affs.rst}        |   62 +-
 .../filesystems/{afs.txt =3D> afs.rst}          |   73 +-
 ...t-control.txt =3D> autofs-mount-control.rst} |  102 +-
 .../filesystems/{befs.txt =3D> befs.rst}        |   59 +-
 .../filesystems/{bfs.txt =3D> bfs.rst}          |   37 +-
 .../filesystems/{btrfs.txt =3D> btrfs.rst}      |    3 +
 .../filesystems/{ceph.txt =3D> ceph.rst}        |   26 +-
 .../filesystems/{cramfs.txt =3D> cramfs.rst}    |   19 +-
 .../filesystems/{debugfs.txt =3D> debugfs.rst}  |   54 +-
 .../filesystems/{dlmfs.txt =3D> dlmfs.rst}      |   28 +-
 .../{ecryptfs.txt =3D> ecryptfs.rst}            |   44 +-
 .../{efivarfs.txt =3D> efivarfs.rst}            |    5 +-
 .../filesystems/{erofs.txt =3D> erofs.rst}      |  175 +-
 .../filesystems/{ext2.txt =3D> ext2.rst}        |   41 +-
 .../filesystems/{ext3.txt =3D> ext3.rst}        |    2 +
 .../filesystems/{f2fs.txt =3D> f2fs.rst}        |  252 +--
 .../{gfs2-uevents.txt =3D> gfs2-uevents.rst}    |   20 +-
 .../filesystems/{gfs2.txt =3D> gfs2.rst}        |   20 +-
 .../filesystems/{hfs.txt =3D> hfs.rst}          |   23 +-
 .../filesystems/{hfsplus.txt =3D> hfsplus.rst}  |    2 +
 .../filesystems/{hpfs.txt =3D> hpfs.rst}        |  239 ++-
 Documentation/filesystems/index.rst           |   46 +-
 .../filesystems/{inotify.txt =3D> inotify.rst}  |   33 +-
 Documentation/filesystems/isofs.rst           |   64 +
 Documentation/filesystems/isofs.txt           |   48 -
 .../filesystems/{nilfs2.txt =3D> nilfs2.rst}    |   40 +-
 .../filesystems/{ntfs.txt =3D> ntfs.rst}        |  143 +-
 ...lecheck.txt =3D> ocfs2-online-filecheck.rst} |   45 +-
 .../filesystems/{ocfs2.txt =3D> ocfs2.rst}      |   31 +-
 Documentation/filesystems/omfs.rst            |  112 ++
 Documentation/filesystems/omfs.txt            |  106 --
 .../{orangefs.txt =3D> orangefs.rst}            |  187 +-
 .../filesystems/{proc.txt =3D> proc.rst}        | 1498 +++++++++--------
 .../filesystems/{qnx6.txt =3D> qnx6.rst}        |   22 +
 ...itramfs.txt =3D> ramfs-rootfs-initramfs.rst} |   54 +-
 .../filesystems/{relay.txt =3D> relay.rst}      |  129 +-
 .../filesystems/{romfs.txt =3D> romfs.rst}      |   42 +-
 .../{squashfs.txt =3D> squashfs.rst}            |   60 +-
 .../filesystems/{sysfs.txt =3D> sysfs.rst}      |  324 ++--
 .../filesystems/{sysv-fs.txt =3D> sysv-fs.rst}  |  155 +-
 .../filesystems/{tmpfs.txt =3D> tmpfs.rst}      |   44 +-
 .../filesystems/ubifs-authentication.rst      |   10 +-
 .../filesystems/{ubifs.txt =3D> ubifs.rst}      |   25 +-
 .../filesystems/{udf.txt =3D> udf.rst}          |   21 +-
 .../filesystems/{zonefs.txt =3D> zonefs.rst}    |  106 +-
 47 files changed, 2739 insertions(+), 2035 deletions(-)
 rename Documentation/filesystems/{9p.txt =3D> 9p.rst} (63%)
 rename Documentation/filesystems/{adfs.txt =3D> adfs.rst} (85%)
 rename Documentation/filesystems/{affs.txt =3D> affs.rst} (86%)
 rename Documentation/filesystems/{afs.txt =3D> afs.rst} (90%)
 rename Documentation/filesystems/{autofs-mount-control.txt =3D> autofs-mou=
nt-control.rst} (89%)
 rename Documentation/filesystems/{befs.txt =3D> befs.rst} (83%)
 rename Documentation/filesystems/{bfs.txt =3D> bfs.rst} (71%)
 rename Documentation/filesystems/{btrfs.txt =3D> btrfs.rst} (96%)
 rename Documentation/filesystems/{ceph.txt =3D> ceph.rst} (91%)
 rename Documentation/filesystems/{cramfs.txt =3D> cramfs.rst} (88%)
 rename Documentation/filesystems/{debugfs.txt =3D> debugfs.rst} (91%)
 rename Documentation/filesystems/{dlmfs.txt =3D> dlmfs.rst} (86%)
 rename Documentation/filesystems/{ecryptfs.txt =3D> ecryptfs.rst} (70%)
 rename Documentation/filesystems/{efivarfs.txt =3D> efivarfs.rst} (85%)
 rename Documentation/filesystems/{erofs.txt =3D> erofs.rst} (54%)
 rename Documentation/filesystems/{ext2.txt =3D> ext2.rst} (91%)
 rename Documentation/filesystems/{ext3.txt =3D> ext3.rst} (88%)
 rename Documentation/filesystems/{f2fs.txt =3D> f2fs.rst} (84%)
 rename Documentation/filesystems/{gfs2-uevents.txt =3D> gfs2-uevents.rst} =
(94%)
 rename Documentation/filesystems/{gfs2.txt =3D> gfs2.rst} (76%)
 rename Documentation/filesystems/{hfs.txt =3D> hfs.rst} (80%)
 rename Documentation/filesystems/{hfsplus.txt =3D> hfsplus.rst} (95%)
 rename Documentation/filesystems/{hpfs.txt =3D> hpfs.rst} (66%)
 rename Documentation/filesystems/{inotify.txt =3D> inotify.rst} (83%)
 create mode 100644 Documentation/filesystems/isofs.rst
 delete mode 100644 Documentation/filesystems/isofs.txt
 rename Documentation/filesystems/{nilfs2.txt =3D> nilfs2.rst} (89%)
 rename Documentation/filesystems/{ntfs.txt =3D> ntfs.rst} (85%)
 rename Documentation/filesystems/{ocfs2-online-filecheck.txt =3D> ocfs2-on=
line-filecheck.rst} (77%)
 rename Documentation/filesystems/{ocfs2.txt =3D> ocfs2.rst} (88%)
 create mode 100644 Documentation/filesystems/omfs.rst
 delete mode 100644 Documentation/filesystems/omfs.txt
 rename Documentation/filesystems/{orangefs.txt =3D> orangefs.rst} (83%)
 rename Documentation/filesystems/{proc.txt =3D> proc.rst} (65%)
 rename Documentation/filesystems/{qnx6.txt =3D> qnx6.rst} (98%)
 rename Documentation/filesystems/{ramfs-rootfs-initramfs.txt =3D> ramfs-ro=
otfs-initramfs.rst} (91%)
 rename Documentation/filesystems/{relay.txt =3D> relay.rst} (91%)
 rename Documentation/filesystems/{romfs.txt =3D> romfs.rst} (86%)
 rename Documentation/filesystems/{squashfs.txt =3D> squashfs.rst} (91%)
 rename Documentation/filesystems/{sysfs.txt =3D> sysfs.rst} (56%)
 rename Documentation/filesystems/{sysv-fs.txt =3D> sysv-fs.rst} (73%)
 rename Documentation/filesystems/{tmpfs.txt =3D> tmpfs.rst} (86%)
 rename Documentation/filesystems/{ubifs.txt =3D> ubifs.rst} (91%)
 rename Documentation/filesystems/{udf.txt =3D> udf.rst} (83%)
 rename Documentation/filesystems/{zonefs.txt =3D> zonefs.rst} (90%)

--=20
2.24.1



