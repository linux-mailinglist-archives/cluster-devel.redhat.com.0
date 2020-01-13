Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B30BC13930C
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jan 2020 15:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578924275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IQK84z38Gjpo//3D9vnJ8GFHErAubebpbbPCv8FUo9k=;
	b=HRUNShfnCZyWxhyIsL9Ir2Ce6P2KLpNVhWXJWm1N/J4I+Bsz6L7I9sgj5z7kMGf4LFLyUd
	+x2oxoz6/1RK21pNuf/4P1GO8h4RovmB/pXdLaVoJtQSChjd8rPfLJFCxgXIUClOolY8DI
	ASSboWBkZAPP94Fx8gruiLMOnRE43F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Qb1gd3FPMtaTS0Omb8ok0w-1; Mon, 13 Jan 2020 09:04:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 275C61005502;
	Mon, 13 Jan 2020 14:04:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B85100164D;
	Mon, 13 Jan 2020 14:04:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9906F18089CF;
	Mon, 13 Jan 2020 14:04:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DE4PwD017066 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 09:04:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F194D19756; Mon, 13 Jan 2020 14:04:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0A8119C6A
	for <cluster-devel@redhat.com>; Mon, 13 Jan 2020 14:04:22 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Jan 2020 08:04:19 -0600
Message-Id: <20200113140421.867659-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/2 v3] Fix infinite loop in ail1 flush
	with jdata
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Qb1gd3FPMtaTS0Omb8ok0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi. This patch set fixes a problem in which gfs2 can become deadlocked
while doing normal IO on jdata files. The problem is best observed by
repeatedly running xfstests generic/269 repeatedly with jdata files.
The specifics of the hang are best described in the second patch.

The first patch reverts e955537e3262de8e56f070b13817f525f472fa00.
The defective patch caused tr->tr_num_revoke to sometimes be a negative
number, since you can remove more revokes than you add. However, since
tr_num_revoke is declared unsigned, it triggered this assert in
gfs2_trans_end:

=09if (gfs2_assert_withdraw(sdp, (nbuf <=3D tr->tr_blocks) &&
=09=09=09       (tr->tr_num_revoke <=3D tr->tr_revokes)))

The management of revokes is not very good since we moved them from a
private list to a global list hung off the superblock pointer, sdp.
So we will probably want to revisit this and rework how revokes are
handled. In the meantime, it is safest to just revert the patch until
we can fix it properly.

The second patch fixes an infinite loop deadlock while flushing the
ail1 list for jdata pages. The patch comments describe the problem
and circumstances fairly well.

Bob Peterson (2):
  Revert "gfs2: eliminate tr_num_revoke_rm"
  gfs2: keep a redirty list for jdata pages that are PageChecked in ail1

 fs/gfs2/incore.h |  2 ++
 fs/gfs2/log.c    | 30 +++++++++++++++++++++++++++++-
 fs/gfs2/trans.c  |  7 ++++---
 3 files changed, 35 insertions(+), 4 deletions(-)

--=20
2.24.1

