Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 384DD147888
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Jan 2020 07:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579847087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o2apLvw2ZVnhKxXiqyCohtgk4NQUVrregAcph1A3rTE=;
	b=Q1Tl9wXuRmWWChUYf8vfc4xzbqyXOBloXn8N2P1eML2R5QlBRRcaofQmElJ6dquAAUe6B3
	/sKn5K7oXwb35Q3+MSbTySO2kiVvu5xeQahE49OkMcKMZNPuzaUotYtaZndXDmxol5VqQR
	oL9CN6UI0+GwZQ29tFRQ0WmE+CfFNgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-_c9Q76ijPVK3Tkhh6iEVtw-1; Fri, 24 Jan 2020 01:24:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 603611005512;
	Fri, 24 Jan 2020 06:24:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EE6081213;
	Fri, 24 Jan 2020 06:24:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3A8C8594A;
	Fri, 24 Jan 2020 06:24:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00O6OYvL008223 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 01:24:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A8B62166B2F; Fri, 24 Jan 2020 06:24:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 834072166B30
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 06:24:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18DA802E78
	for <cluster-devel@redhat.com>; Fri, 24 Jan 2020 06:24:32 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-308-fuYl5752PVeS7dg9pQLe9w-1;
	Fri, 24 Jan 2020 01:24:28 -0500
Received: from vvs-ws.sw.ru ([172.16.24.21])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vvs@virtuozzo.com>)
	id 1ius3g-0007mK-JM; Fri, 24 Jan 2020 09:03:08 +0300
From: Vasily Averin <vvs@virtuozzo.com>
To: cluster-devel@redhat.com
Message-ID: <5fb7919e-3bb7-3c90-b42d-495a63b71457@virtuozzo.com>
Date: Fri, 24 Jan 2020 09:03:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: fuYl5752PVeS7dg9pQLe9w-1
X-MC-Unique: _c9Q76ijPVK3Tkhh6iEVtw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00O6OYvL008223
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/1] table_seq_next should increase position
	index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

if seq_file .next fuction does not change position index,
read after some lseek can generate unexpected output.

https://bugzilla.kernel.org/show_bug.cgi?id=3D206283
Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 fs/dlm/debug_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index d6bbccb..c1eda93 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -523,7 +523,7 @@ static void *table_seq_next(struct seq_file *seq, void =
*iter_ptr, loff_t *pos)
 =09=09ri->rsb =3D r;
 =09=09spin_unlock(&ls->ls_rsbtbl[bucket].lock);
 =09=09dlm_put_rsb(rp);
-=09=09++*pos;
+=09=09++(*pos);
 =09=09return ri;
 =09}
 =09spin_unlock(&ls->ls_rsbtbl[bucket].lock);
@@ -542,6 +542,7 @@ static void *table_seq_next(struct seq_file *seq, void =
*iter_ptr, loff_t *pos)
=20
 =09=09if (bucket >=3D ls->ls_rsbtbl_size) {
 =09=09=09kfree(ri);
+=09=09=09++(*pos);
 =09=09=09return NULL;
 =09=09}
 =09=09tree =3D toss ? &ls->ls_rsbtbl[bucket].toss : &ls->ls_rsbtbl[bucket]=
.keep;
--=20
1.8.3.1


