Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6E8164075
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 10:33:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582104801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g7qX9mp4oJ6yBemyXwClHjkdSOM0BIl1OFgwFQscLhE=;
	b=BA+VoUQsaGD0Opi1Y2ySSUygC6R2VBEbx1Ocr4eowWBZBNUjS5ku7luJ4ZNMKmJ1goLIvy
	Lt8yxgt2+fEkajg2z09RNGr+ScLvRqUUyDEp5Kf64iLH6Eb+DGqhWsLtvnn1ocC+q4N0TS
	ojWcfMNLghgNu1h58J3azyGL/wgfNPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-31E53qtZNp2qHWsV7sTHug-1; Wed, 19 Feb 2020 04:33:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82FF4DB6B;
	Wed, 19 Feb 2020 09:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C53362660;
	Wed, 19 Feb 2020 09:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2D7D1809567;
	Wed, 19 Feb 2020 09:33:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9X5Pk026990 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:33:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 455292166B28; Wed, 19 Feb 2020 09:33:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413932166B2A
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 09:33:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E411101D250
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 09:33:03 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-373-2f_m5vJUMt-3MbrGGGzyjA-1;
	Wed, 19 Feb 2020 04:32:58 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 558BA2DC;
	Wed, 19 Feb 2020 09:32:40 +0000 (UTC)
Date: Wed, 19 Feb 2020 02:32:34 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200219023234.7b704acb@lwn.net>
In-Reply-To: <20200218110406.098fdc09@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
	<20200218040146.GM7778@bombadil.infradead.org>
	<20200218110406.098fdc09@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-MC-Unique: 2f_m5vJUMt-3MbrGGGzyjA-1
X-MC-Unique: 31E53qtZNp2qHWsV7sTHug-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9X5Pk026990
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Brandenburg <martin@omnibond.com>,
	Jan Kara <jack@suse.cz>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Martinet <asmadeus@codewreck.org>, Amir Goldstein <amir73il@gmail.com>,
	Copeland <me@bobcopeland.com>,
	David Howells <dhowells@redhat.com>, Mason <clm@fb.com>,
	linux-mtd@lists.infradead.org, Dominique,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	Jan Kara <jack@suse.com>, Mike Marshall <hubcap@omnibond.com>,
	Aota <naohiro.aota@wdc.com>, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, Sage Weil <sage@redhat.com>,
	Richard Weinberger <richard@nod.at>, Matthew Wilcox <willy@infradead.org>,
	Tyler Hicks <code@tyhicks.com>, Naohiro,
	v9fs-developer@lists.sourceforge.net,
	Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
	Salah Triki <salah.triki@gmail.com>,
	Alexey Dobriyan <adobriyan@gmail.com>, devel@lists.orangefs.org,
	Nicolas, Chao Yu <chao@kernel.org>,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, Johannes,
	David Sterba <dsterba@suse.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Chris,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, Martin, linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, Bob,
	Thumshirn <jth@kernel.org>, linux-erofs@lists.ozlabs.org,
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
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2020 11:04:06 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Then, do a second pass at files outside the new directories (like
> admin-guide), in order to better organize things, eventually splitting
> some files into kAPI, uAPI and/or admin-guide.

I'm looking forward to this phase!  Yes it is harder, and it often
requires selling the idea to skeptical maintainers.  But that is how,
IMO, we get from where we're at now to something closer to a set of
coherent kernel docs.

Thanks,

jon


