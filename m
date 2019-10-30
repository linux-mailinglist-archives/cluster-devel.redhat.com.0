Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 449E7E9AB6
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Oct 2019 12:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572434707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WyEl0wLRTIq+YoJeUVVm33OKOBR2PjTrxSrJAN0xprI=;
	b=BGgyeNWuroskx7SF8HIIhEVLKflKdO7Nn/vxOSNoP9Wbn124G8Sg8hhg26UEcMhBH4nKzu
	MHXa3WV49Tc9uM3XpHVOFf4TE+LKUXGusk73Fm7IkRWIwZb/zLoVO6Gplc/Q3Ji14X1SOk
	OsKfQZG11Dkb7y1Y1VCbbM+5a+hTdUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-tiVxtfboOGWAZVwDNhYFjw-1; Wed, 30 Oct 2019 07:25:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D4AD800C61;
	Wed, 30 Oct 2019 11:25:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6AC55C1BB;
	Wed, 30 Oct 2019 11:25:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1A924BB5C;
	Wed, 30 Oct 2019 11:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UBOw8s018900 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 07:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 407E15DA2C; Wed, 30 Oct 2019 11:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.206.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C8595DA70;
	Wed, 30 Oct 2019 11:24:52 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Oct 2019 12:24:49 +0100
Message-Id: <20191030112449.24984-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix remounting (broken in -rc1)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tiVxtfboOGWAZVwDNhYFjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Linus,

could you please pull the following fix for gfs2?

Thanks,
Andreas

The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02=
:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-v5.4-rc5.fixes

for you to fetch changes up to d5798141fd54cea074c3429d5803f6c41ade0ca8:

  gfs2: Fix initialisation of args for remount (2019-10-30 12:16:53 +0100)

----------------------------------------------------------------
Fix remounting (broken in -rc1).

----------------------------------------------------------------
Andrew Price (1):
      gfs2: Fix initialisation of args for remount

 fs/gfs2/ops_fstype.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

