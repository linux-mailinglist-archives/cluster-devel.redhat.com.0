Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFFE115804
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Dec 2019 20:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575662126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xh+vWtRw+W1cOBgis8fGEJL3565tzGE6grK33xAGH2s=;
	b=fpXpqoz2dPCE1uZ2COgWrdL7ntz4+H34Afq6At3XWBwKoHHcNqGAfPrPGHGgYA4u0FnjDh
	7E4GQF6W1yTMnFFQwInRIZ5KWyAkLB9WT54o57UiCw5700xsadsZzozNpZjln/RBWUghr7
	huZr+4VNzJJ6rMxn4LFN+V6qOh+dw/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-8wBcoe1UOdSPe8DG5uwHhQ-1; Fri, 06 Dec 2019 14:55:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B338024F1;
	Fri,  6 Dec 2019 19:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A3E26B8FB;
	Fri,  6 Dec 2019 19:55:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CBA918089CD;
	Fri,  6 Dec 2019 19:55:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6Jt4Gn009127 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 14:55:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 374362166B2D; Fri,  6 Dec 2019 19:55:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330D02166B2E
	for <cluster-devel@redhat.com>; Fri,  6 Dec 2019 19:55:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22A11803B4C
	for <cluster-devel@redhat.com>; Fri,  6 Dec 2019 19:55:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-203-TGbvnybbNzqt0WzLWM-_1w-1;
	Fri, 06 Dec 2019 14:54:58 -0500
Received: from localhost (c-67-169-218-210.hsd1.or.comcast.net
	[67.169.218.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9FE602464E;
	Fri,  6 Dec 2019 19:54:56 +0000 (UTC)
Date: Fri, 6 Dec 2019 11:54:56 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191206195456.GB9464@magnolia>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-MC-Unique: TGbvnybbNzqt0WzLWM-_1w-1
X-MC-Unique: 8wBcoe1UOdSPe8DG5uwHhQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB6Jt4Gn009127
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, david@fromorbit.com,
	Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, sandeen@sandeen.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4 <linux-ext4@vger.kernel.org>, hch@lst.de
Subject: [Cluster-devel] [GIT PULL] iomap: fixes for 5.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Linus,

Please pull these iomap bug fixes for 5.5-rc1, which fix a race
condition and a use-after-free error.

The branch has survived overnight xfstests runs and merges cleanly with
this morning's master.  Please let me know if anything strange happens.

--D

The following changes since commit 88cfd30e188fcf6fd8304586c936a6f22fb665e5=
:

  iomap: remove unneeded variable in iomap_dio_rw() (2019-11-26 09:28:47 -0=
800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git tags/iomap-5.5-merge-14

for you to fetch changes up to c275779ff2dd51c96eaae04fac5d766421d6c596:

  iomap: stop using ioend after it's been freed in iomap_finish_ioend() (20=
19-12-05 07:41:16 -0800)

----------------------------------------------------------------
Fixes for 5.5-rc1:
- Fix a UAF when reporting writeback errors
- Fix a race condition when handling page uptodate on a blocksize <
  pagesize file that is also fragmented

----------------------------------------------------------------
Christoph Hellwig (1):
      iomap: fix sub-page uptodate handling

Zorro Lang (1):
      iomap: stop using ioend after it's been freed in iomap_finish_ioend()

 fs/iomap/buffered-io.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)


