Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E6E0C1765AD
	for <lists+cluster-devel@lfdr.de>; Mon,  2 Mar 2020 22:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583183623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AA3vxto5rgw43zY4o9vhy7PIyVu2laHuF6fbQ5G3+as=;
	b=NuSlFsclWAg5AC4JFEuDTN3RBBM/R+EcZ3HgiAQlEXB5CHWjIyz+sImK3RiHf95GwHSo3s
	s0pCvLyMbeHOS4xUoaaY28JIZtkWSz1qnP0jOACMgRCz/cK+MNBTU8ylN3ooXWpkDx8Nyu
	++lQkKYcW1bbw3BBeTLwCB63KnoTZpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-cHJn5H-1MtCEGl8wgX4_Fg-1; Mon, 02 Mar 2020 16:13:42 -0500
X-MC-Unique: cHJn5H-1MtCEGl8wgX4_Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E8EC107ACC7;
	Mon,  2 Mar 2020 21:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F16C35DA2C;
	Mon,  2 Mar 2020 21:13:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B7E284481;
	Mon,  2 Mar 2020 21:13:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022LDQgh032301 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 16:13:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D295D1D0B; Mon,  2 Mar 2020 21:13:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CBED95E9
	for <cluster-devel@redhat.com>; Mon,  2 Mar 2020 21:13:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49CCA86D725
	for <cluster-devel@redhat.com>; Mon,  2 Mar 2020 21:13:24 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-252-8DUQYKXqOTe1KAwQc8ODxw-1;
	Mon, 02 Mar 2020 16:13:22 -0500
X-MC-Unique: 8DUQYKXqOTe1KAwQc8ODxw-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 96EE92E4;
	Mon,  2 Mar 2020 21:13:17 +0000 (UTC)
Date: Mon, 2 Mar 2020 14:13:16 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200302141316.4269b22d@lwn.net>
In-Reply-To: <cover.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022LDQgh032301
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	linux-mtd@lists.infradead.org, Tyler Hicks <code@tyhicks.com>,
	linux-afs@lists.infradead.org, Marshall <hubcap@omnibond.com>,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
	Fasheh <mark@fasheh.com>, Jeff, Chris Mason <clm@fb.com>, Mark,
	cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
	Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Mike,
	ecryptfs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
	Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-fsdevel@vger.kernel.org, Andreas,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, Anton Altaparmakov <anton@tuxera.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
	linux-ntfs-dev@lists.sourceforge.net, Layton <jlayton@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Johannes Thumshirn <jth@kernel.org>, linux-erofs@lists.ozlabs.org,
	linux-karma-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Feb 2020 17:11:46 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are lots of plain text documents under Documentation/filesystems.
>=20
> Manually convert several of those to ReST and add them to the index file.

OK, I've finally managed to add all the acks and wrestle this pile into
docs-next - thanks.

jon


