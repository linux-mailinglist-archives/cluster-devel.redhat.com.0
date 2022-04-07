Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 086404F7022
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Apr 2022 03:18:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-kanbKdunM3yGRHojGhZ2FQ-1; Wed, 06 Apr 2022 21:18:03 -0400
X-MC-Unique: kanbKdunM3yGRHojGhZ2FQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F7B818812C8;
	Thu,  7 Apr 2022 01:18:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 635A540CF910;
	Thu,  7 Apr 2022 01:17:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7014C194036C;
	Thu,  7 Apr 2022 01:17:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 937801949763 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 01:17:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 651562166B4F; Thu,  7 Apr 2022 01:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6018F2166B1A
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:17:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC4233C11C88
 for <cluster-devel@redhat.com>; Thu,  7 Apr 2022 01:17:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-Ue39d_q-PCWctOHTNxRBzw-1; Wed, 06 Apr 2022 21:17:39 -0400
X-MC-Unique: Ue39d_q-PCWctOHTNxRBzw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6B8AB82689;
 Thu,  7 Apr 2022 01:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E85C385A7;
 Thu,  7 Apr 2022 01:10:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed,  6 Apr 2022 21:10:00 -0400
Message-Id: <20220407011029.113321-2-sashal@kernel.org>
In-Reply-To: <20220407011029.113321-1-sashal@kernel.org>
References: <20220407011029.113321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [PATCH AUTOSEL 5.17 02/31] gfs2: cancel timed-out
 glock requests
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit 1fc05c8d8426d4085a219c23f8855c4aaf9e3ffb ]

The gfs2 evict code tries to upgrade the iopen glock from SH to EX. If
the attempt to upgrade times out, gfs2 needs to tell dlm to cancel the
lock request or it can deadlock. We also need to wake up the process
waiting for the lock when dlm sends its AST back to gfs2.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 6b23399eaee0..d368d9a2e8f0 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -669,6 +669,8 @@ static void finish_xmote(struct gfs2_glock *gl, unsigne=
d int ret)
=20
 =09/* Check for state !=3D intended state */
 =09if (unlikely(state !=3D gl->gl_target)) {
+=09=09if (gh && (ret & LM_OUT_CANCELED))
+=09=09=09gfs2_holder_wake(gh);
 =09=09if (gh && !test_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags)) {
 =09=09=09/* move to back of queue and try next entry */
 =09=09=09if (ret & LM_OUT_CANCELED) {
@@ -1691,6 +1693,14 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 =09struct gfs2_glock *gl =3D gh->gh_gl;
=20
 =09spin_lock(&gl->gl_lockref.lock);
+=09if (list_is_first(&gh->gh_list, &gl->gl_holders) &&
+=09    !test_bit(HIF_HOLDER, &gh->gh_iflags)) {
+=09=09spin_unlock(&gl->gl_lockref.lock);
+=09=09gl->gl_name.ln_sbd->sd_lockstruct.ls_ops->lm_cancel(gl);
+=09=09wait_on_bit(&gh->gh_iflags, HIF_WAIT, TASK_UNINTERRUPTIBLE);
+=09=09spin_lock(&gl->gl_lockref.lock);
+=09}
+
 =09__gfs2_glock_dq(gh);
 =09spin_unlock(&gl->gl_lockref.lock);
 }
--=20
2.35.1

