Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 651B9E3626
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Oct 2019 17:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571929520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C3O8xkMlNTacs7QFl/kG+JtoRc2JwZyKRRSlmHSj0Xk=;
	b=chVahwbRYny96a+oa9MX3oM6ltYPDOrPo4b2B+dkuDTTRjqbdYE7z8/iqDlMEuQeSeCt04
	+ZZfpqaZKD5I++8tVTijM7f8hsJ5yhpZ9GRQr5W7AvzPMOf4WMzGaXoZusitjka0SaUjEO
	i7rrMUrpJpDLFB4JEPVeQOW/e09BMK8=
Received: from mimecast-mx01.redhat.com (209.132.183.4 [209.132.183.4])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-GLfsYT76OUOMenk0aToXfw-1; Thu, 24 Oct 2019 11:00:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BDD296E552;
	Thu, 24 Oct 2019 14:51:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B08FA6CE59;
	Thu, 24 Oct 2019 14:51:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26C5918005A0;
	Thu, 24 Oct 2019 14:51:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OEpOVY031302 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 10:51:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97DAB6061E; Thu, 24 Oct 2019 14:51:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB0660A97;
	Thu, 24 Oct 2019 14:51:23 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Oct 2019 16:51:20 +0200
Message-Id: <20191024145120.16939-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [GIT PULL] gfs2: Fix a memory leak introduced in
	-rc1
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GLfsYT76OUOMenk0aToXfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please consider pulling the following fix for gfs2.

Thanks,
Andreas

The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241=
:

  Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gf=
s2-v5.4-rc4.fixes

for you to fetch changes up to 30aecae86e914f526a2ca8d552011960ef6a2615:

  gfs2: Fix memory leak when gfs2meta's fs_context is freed (2019-10-24 16:=
20:43 +0200)

----------------------------------------------------------------
Fix a memory leak introduced in -rc1.

----------------------------------------------------------------
Andrew Price (1):
      gfs2: Fix memory leak when gfs2meta's fs_context is freed

 fs/gfs2/ops_fstype.c | 1 +
 1 file changed, 1 insertion(+)

