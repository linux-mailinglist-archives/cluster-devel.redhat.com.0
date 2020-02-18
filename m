Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA03161FB5
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 05:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581998546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8O+G5JMzZ1qK3NK14v/Knibeq0ghI0AbgeMyurqBwlE=;
	b=H+gpd4OfJb4bHd6WsPxi44M6r++w3psL2BFAl8/TdSLpEmceNpUWvSWUME5SzNfN5+9BPw
	TDU6djXFC/fqk1weqOHECBe4cWxaX8vjhEGNslj6CaqoZLN0tJMfgJd2VBdC3v+IVChV1e
	f2h01E6KW7H2pezcJnAAByBx3U7M7uQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-b9WWO4EtOpyiXGI3KyXVjg-1; Mon, 17 Feb 2020 23:02:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6EB1857346;
	Tue, 18 Feb 2020 04:02:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87C9A90F6B;
	Tue, 18 Feb 2020 04:02:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D855135AF4;
	Tue, 18 Feb 2020 04:02:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I427j2022299 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 23:02:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44C1D10DCF4C; Tue, 18 Feb 2020 04:02:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 400BB10DCF4B
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 04:02:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2BC80030B
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 04:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-tr5YImrOO-SnvtLs-zpqIg-1; Mon, 17 Feb 2020 23:01:59 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3u4w-00078u-UB; Tue, 18 Feb 2020 04:01:46 +0000
Date: Mon, 17 Feb 2020 20:01:46 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200218040146.GM7778@bombadil.infradead.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
X-MC-Unique: tr5YImrOO-SnvtLs-zpqIg-1
X-MC-Unique: b9WWO4EtOpyiXGI3KyXVjg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I427j2022299
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Richard Weinberger <richard@nod.at>,
	Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
	Chao Yu <chao@kernel.org>,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
	linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
	Johannes Thumshirn <jth@kernel.org>, linux-erofs@lists.ozlabs.org,
	linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 00/44] Manually convert filesystem FS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 05:11:46PM +0100, Mauro Carvalho Chehab wrote:
> There are lots of plain text documents under Documentation/filesystems.
>=20
> Manually convert several of those to ReST and add them to the index file.

I think at least 90% of this material needs to be in admin-guide.  Should
we create Documentation/admin-guide/filesystems/ and move most of these
files there?


