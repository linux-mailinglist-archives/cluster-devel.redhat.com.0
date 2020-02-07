Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48417155727
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Feb 2020 12:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581076257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oAKW75YumCR0UbvPJKFjZySeKTnVVxYcXzYJXOy1G/4=;
	b=bdtyBpi/OjQBHNs6sV10cDOIMQfZPxWO1eYg2OVpHGKqjt75xEdyw+CSdo8gKhL8AYfpGw
	RNfmlBZPXrvmWY73G8X8tL87/mLCjRcvSR1PSANwYZfmHDMeNwTyPpOTKWmrRDsL/rcrmY
	gq+9f3N9komyp3fENOSwOoA2EE1+T3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-_JTwTaOHMp2FvHc-uqK_ig-1; Fri, 07 Feb 2020 06:50:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E89E8018A4;
	Fri,  7 Feb 2020 11:50:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C169196AE;
	Fri,  7 Feb 2020 11:50:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7B0B866B9;
	Fri,  7 Feb 2020 11:50:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017Bojhf031508 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 06:50:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2DD33863A5; Fri,  7 Feb 2020 11:50:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-44.brq.redhat.com [10.40.204.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D0FF7FB60;
	Fri,  7 Feb 2020 11:50:41 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri,  7 Feb 2020 12:50:39 +0100
Message-Id: <20200207115039.48920-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] GFS2 changes for the 5.6 merge window (2)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _JTwTaOHMp2FvHc-uqK_ig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

could you please pull the following additional changes for gfs2?

Thanks a lot,
Andreas

The following changes since commit a62aa6f7f50a9a0af5e07d98774f8a7b439d390f=
:

  Merge tag 'gfs2-for-5.6' of git://git.kernel.org/pub/scm/linux/kernel/git=
/gfs2/linux-gfs2 (2020-01-31 13:07:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-for-5.6-2

for you to fetch changes up to 6e5e41e2dc4e4413296d5a4af54ac92d7cd52317:

  gfs2: fix O_SYNC write handling (2020-02-06 18:49:41 +0100)

----------------------------------------------------------------
Changes in gfs2:

- Fix a bug in Abhi Das's journal head lookup improvements that can cause a
  valid journal to be rejected.
- Fix an O_SYNC write handling bug reported by Christoph Hellwig.

----------------------------------------------------------------
Abhi Das (1):
      gfs2: fix gfs2_find_jhead that returns uninitialized jhead with seq 0

Andreas Gruenbacher (1):
      gfs2: fix O_SYNC write handling

Christoph Hellwig (1):
      gfs2: move setting current->backing_dev_info

 fs/gfs2/file.c | 72 +++++++++++++++++++++++++-----------------------------=
----
 fs/gfs2/lops.c |  2 +-
 2 files changed, 32 insertions(+), 42 deletions(-)

