Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 998E940CE5D
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Sep 2021 22:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631738620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewGDvYzNtNGIYSp5xbBNyFdtiGP+q//aamKrbPWWic4=;
	b=EA6Gmm6PcqQ39SX79BBP07zASwiAlMS4pME/hceOqexBNrR3Op6j6DPFyTe7J/zadjQhDV
	VSyfoDchlsRFdp0u3etDKBe9FnKn7jHB89vjK3XA3YVZWI4m/hVcASCuRlKu43wdfo/kru
	iQFQ4WjzynZHrUDYvuGtsFKwwBkwqhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-vViXrsakPGSLj8BDFzXDPg-1; Wed, 15 Sep 2021 16:43:39 -0400
X-MC-Unique: vViXrsakPGSLj8BDFzXDPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0474F8042C3;
	Wed, 15 Sep 2021 20:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDDD7100238C;
	Wed, 15 Sep 2021 20:43:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E61961809C81;
	Wed, 15 Sep 2021 20:43:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FKdSU7032303 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 16:39:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FB2360BD8; Wed, 15 Sep 2021 20:39:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E7B7604CC;
	Wed, 15 Sep 2021 20:39:28 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 15 Sep 2021 16:39:13 -0400
Message-Id: <20210915203916.3661690-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/3] fs: dlm: recovery ops and wait
	changes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch series changes the recovery behaviour to call
dlm_lsop_recover_prep() callback only once between dlm_ls_start() and
dlm_ls_stop(). Currently if recovery gets interrupted by another
dlm_ls_stop() it could be we calling this callback multiple times and
the dlm_lsop_recover_done() was not called yet. Users might depend on the
behaviour that the dlm_lsop_recover_prep() is only called once followed
by a final dlm_lsop_recover_done() call.

Another change is that dlm_new_lockspace() will wait until the recovery is
done. The current behaviour is that the dlm_new_lockspace() will wait until
lockspace member configuration seems to be valid. After the members
configuration the recovery can still get interrupted by another
dlm_ls_stop() call and dlm_new_lockspace() moves on at that point when
recovery is still not done yet. The most kernel users have already a wait
for the dlm_lsop_recover_done() after calling dlm_new_lockspace() which
is not necessary now. However the old behaviour should still work.

I tested this patch series with an experimental python bindings to libdlm.
I will send soon patches which will add those bindings and test to the
dlm user space software repository.

- Alex

Alexander Aring (3):
  fs: dlm: add notes for recovery and membership handling
  fs: dlm: call dlm_lsop_recover_prep once
  fs: dlm: let new_lockspace() wait until recovery

 fs/dlm/dlm_internal.h |  4 ++--
 fs/dlm/lockspace.c    |  9 +++++----
 fs/dlm/member.c       | 30 +++++++++++++++---------------
 fs/dlm/recoverd.c     | 17 +++++++++++++++++
 4 files changed, 39 insertions(+), 21 deletions(-)

-- 
2.27.0

