Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0D8665A54
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 12:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673437118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WebckqozY5Sw/kGnJIHneF0cy+M31dLeqzfwJ5qtkTc=;
	b=KYiPSxuXndsuKTc5VhaRnHVtE8gt9NT47wBl+apeQzIA0PXi+jhAfsHVBVmWPYQXpPVJt6
	6oTb21KFcioYmhw0Nt/dGM92HS7v2WeF/jdsLeeiTecLBMLdU2XI1e3YsBfk8LwxX58Qzh
	hk1vVOmw9fXFWC7ze+QrkXoqdXs4yrY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-5xamjeigPHqUrkyyw4WIcw-1; Wed, 11 Jan 2023 06:38:35 -0500
X-MC-Unique: 5xamjeigPHqUrkyyw4WIcw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72BDB101A52E;
	Wed, 11 Jan 2023 11:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7CA492C14;
	Wed, 11 Jan 2023 11:38:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F28ED19465A4;
	Wed, 11 Jan 2023 11:38:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 49A081946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 11:38:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C2BF422FE; Wed, 11 Jan 2023 11:38:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 244FB422A9
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 11:38:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0109B381458D
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 11:38:12 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-YkHa2v9bMm-FReITqWs_rQ-1; Wed, 11 Jan 2023 06:38:10 -0500
X-MC-Unique: YkHa2v9bMm-FReITqWs_rQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1B33B81B77;
 Wed, 11 Jan 2023 11:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7DCC433EF;
 Wed, 11 Jan 2023 11:30:56 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 11 Jan 2023 12:30:18 +0100
Message-Id: <20230111113018.459199-17-gregkh@linuxfoundation.org>
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307;
 i=gregkh@linuxfoundation.org; h=from:subject;
 bh=AkE/lv0ihMfPjfXKWuy9LtK/5fpHAGwJNbIk/sxtpZA=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDMn75p6qlZSdpHHrmcBJ6auiRXqc+nP3tQvs417G8PzQwq+C
 fzXPd8SyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEit4xLJhktThKvivX6kZh3JRCx2
 gDdQPFZQxz+PzNY5+ezc2TFX3zzFfpjHBUSHkpAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH v2 16/16] kobject: kset_uevent_ops: make
 uevent() callback take a const *
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The uevent() callback in struct kset_uevent_ops does not modify the
kobject passed into it, so make the pointer const to enforce this
restriction.  When doing so, fix up all existing uevent() callbacks to
have the correct signature to preserve the build.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c     | 4 ++--
 fs/dlm/lockspace.c      | 4 ++--
 fs/gfs2/sys.c           | 6 +++---
 include/linux/kobject.h | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 72ec54a8a4e1..b0cee0f30d8d 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2387,9 +2387,9 @@ static const char *dev_uevent_name(const struct kobje=
ct *kobj)
 =09return NULL;
 }
=20
-static int dev_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
+static int dev_uevent(const struct kobject *kobj, struct kobj_uevent_env *=
env)
 {
-=09struct device *dev =3D kobj_to_dev(kobj);
+=09const struct device *dev =3D kobj_to_dev(kobj);
 =09int retval =3D 0;
=20
 =09/* add device node properties if present */
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index d0b4e2181a5f..9b6cfc4c30e3 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -215,9 +215,9 @@ static int do_uevent(struct dlm_ls *ls, int in)
 =09return ls->ls_uevent_result;
 }
=20
-static int dlm_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
+static int dlm_uevent(const struct kobject *kobj, struct kobj_uevent_env *=
env)
 {
-=09struct dlm_ls *ls =3D container_of(kobj, struct dlm_ls, ls_kobj);
+=09const struct dlm_ls *ls =3D container_of(kobj, struct dlm_ls, ls_kobj);
=20
 =09add_uevent_var(env, "LOCKSPACE=3D%s", ls->ls_name);
 =09return 0;
diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index d87ea98cf535..d8dfabb0bc12 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -767,10 +767,10 @@ void gfs2_sys_fs_del(struct gfs2_sbd *sdp)
 =09wait_for_completion(&sdp->sd_kobj_unregister);
 }
=20
-static int gfs2_uevent(struct kobject *kobj, struct kobj_uevent_env *env)
+static int gfs2_uevent(const struct kobject *kobj, struct kobj_uevent_env =
*env)
 {
-=09struct gfs2_sbd *sdp =3D container_of(kobj, struct gfs2_sbd, sd_kobj);
-=09struct super_block *s =3D sdp->sd_vfs;
+=09const struct gfs2_sbd *sdp =3D container_of(kobj, struct gfs2_sbd, sd_k=
obj);
+=09const struct super_block *s =3D sdp->sd_vfs;
=20
 =09add_uevent_var(env, "LOCKTABLE=3D%s", sdp->sd_table_name);
 =09add_uevent_var(env, "LOCKPROTO=3D%s", sdp->sd_proto_name);
diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index 58a5b75612e3..bdab370a24f4 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -137,7 +137,7 @@ struct kobj_uevent_env {
 struct kset_uevent_ops {
 =09int (* const filter)(const struct kobject *kobj);
 =09const char *(* const name)(const struct kobject *kobj);
-=09int (* const uevent)(struct kobject *kobj, struct kobj_uevent_env *env)=
;
+=09int (* const uevent)(const struct kobject *kobj, struct kobj_uevent_env=
 *env);
 };
=20
 struct kobj_attribute {
--=20
2.39.0

