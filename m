Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DCE7B1C9BE3
	for <lists+cluster-devel@lfdr.de>; Thu,  7 May 2020 22:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588882519;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gh1IpNWMMjW1D0CBCziPD5xOzfnZ0sxH+HpFwBDHfOc=;
	b=hNKpAZW4PBn/yQYnE8jJNb1kSct6TRd3/CkMtrAh1aSPVo7VwDzst+pEcndN5PUfKrKzAj
	M6apbF0WrUH7CweD3A4+eCIcNvB5yvrVg9VM7kL/XurNbnh7NaEUAg08204vewiNF2L50D
	ZhKHVMH5qzGpbt9zw9tonKNNeO7CE+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288--4wQX7tVM2yyyCvGs37j_w-1; Thu, 07 May 2020 16:15:17 -0400
X-MC-Unique: -4wQX7tVM2yyyCvGs37j_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 291BD800687;
	Thu,  7 May 2020 20:15:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 622AF10016E8;
	Thu,  7 May 2020 20:15:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A4124CAA0;
	Thu,  7 May 2020 20:15:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047Ird6W016431 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 14:53:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC2912156A2E; Thu,  7 May 2020 18:53:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C86A52157F26
	for <cluster-devel@redhat.com>; Thu,  7 May 2020 18:53:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D025811E77
	for <cluster-devel@redhat.com>; Thu,  7 May 2020 18:53:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-436-Q2lFHNv_PQSmwDXRo3e4aA-1;
	Thu, 07 May 2020 14:53:34 -0400
X-MC-Unique: Q2lFHNv_PQSmwDXRo3e4aA-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CAC12221F7;
	Thu,  7 May 2020 18:47:38 +0000 (UTC)
Date: Thu, 7 May 2020 13:52:05 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
Message-ID: <20200507185205.GA14139@embeddedor>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047Ird6W016431
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 16:15:05 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: Replace zero-length array with
	flexible-array
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/dlm/dlm_internal.h |    6 +++---
 fs/dlm/user.c         |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 416d9de35679..d231ae5d2c65 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -421,7 +421,7 @@ struct dlm_message {
 =09int=09=09=09m_bastmode;
 =09int=09=09=09m_asts;
 =09int=09=09=09m_result;=09/* 0 or -EXXX */
-=09char=09=09=09m_extra[0];=09/* name or lvb */
+=09char=09=09=09m_extra[];=09/* name or lvb */
 };
=20
=20
@@ -450,7 +450,7 @@ struct dlm_rcom {
 =09uint64_t=09=09rc_id;=09=09/* match reply with request */
 =09uint64_t=09=09rc_seq;=09=09/* sender's ls_recover_seq */
 =09uint64_t=09=09rc_seq_reply;=09/* remote ls_recover_seq */
-=09char=09=09=09rc_buf[0];
+=09char=09=09=09rc_buf[];
 };
=20
 union dlm_packet {
@@ -506,7 +506,7 @@ struct rcom_lock {
 =09__le16=09=09=09rl_wait_type;
 =09__le16=09=09=09rl_namelen;
 =09char=09=09=09rl_name[DLM_RESNAME_MAXLEN];
-=09char=09=09=09rl_lvb[0];
+=09char=09=09=09rl_lvb[];
 };
=20
 /*
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 5264bac75115..e5cefa90b1ce 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -46,7 +46,7 @@ struct dlm_lock_params32 {
 =09__u32 bastaddr;
 =09__u32 lksb;
 =09char lvb[DLM_USER_LVB_LEN];
-=09char name[0];
+=09char name[];
 };
=20
 struct dlm_write_request32 {


