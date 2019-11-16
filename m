Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 63F94FEEA5
	for <lists+cluster-devel@lfdr.de>; Sat, 16 Nov 2019 16:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573919613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aD6e0TTBw0338zsQRbpxtg2v1afPTE7qPccv2BDeyXs=;
	b=D4k6BTt2q6I2+Zk7O57FvXXtNW0Niyfk8gfrsq3h6d3ygvGQvA2an5LXSGE2VF0Ytt9yXw
	/8ZZK1zLFSY8bzBhn+zS1ZpeZ30lAA95/y1xAfTI5zLW0FDtkCjzLHLYDOecyJ1qojfkL1
	sNk94ehfHid3FYTmhTiI67kzu5SE6DU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-6U6416mRMlik804mlfsqag-1; Sat, 16 Nov 2019 10:53:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63FB1800EBA;
	Sat, 16 Nov 2019 15:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 518135DDDA;
	Sat, 16 Nov 2019 15:53:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F7D818089CD;
	Sat, 16 Nov 2019 15:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAGFrR9W013820 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 Nov 2019 10:53:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D1E1200BCF6; Sat, 16 Nov 2019 15:53:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EC82026D69
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73D7E800311
	for <cluster-devel@redhat.com>; Sat, 16 Nov 2019 15:53:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-194-CwkK6ECZM3uJCyaOhuIYrA-1;
	Sat, 16 Nov 2019 10:53:21 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E9DB2218A3;
	Sat, 16 Nov 2019 15:53:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 16 Nov 2019 10:50:51 -0500
Message-Id: <20191116155103.10971-88-sashal@kernel.org>
In-Reply-To: <20191116155103.10971-1-sashal@kernel.org>
References: <20191116155103.10971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: CwkK6ECZM3uJCyaOhuIYrA-1
X-MC-Unique: 6U6416mRMlik804mlfsqag-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAGFrR9W013820
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
	Tycho Andersen <tycho@tycho.ws>
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 88/99] dlm: don't leak kernel
	pointer to userspace
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Tycho Andersen <tycho@tycho.ws>

[ Upstream commit 9de30f3f7f4d31037cfbb7c787e1089c1944b3a7 ]

In copy_result_to_user(), we first create a struct dlm_lock_result, which
contains a struct dlm_lksb, the last member of which is a pointer to the
lvb. Unfortunately, we copy the entire struct dlm_lksb to the result
struct, which is then copied to userspace at the end of the function,
leaking the contents of sb_lvbptr, which is a valid kernel pointer in some
cases (indeed, later in the same function the data it points to is copied
to userspace).

It is an error to leak kernel pointers to userspace, as it undermines KASLR
protections (see e.g. 65eea8edc31 ("floppy: Do not copy a kernel pointer to
user memory in FDGETPRM ioctl") for another example of this).

Signed-off-by: Tycho Andersen <tycho@tycho.ws>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 9ac65914ab5b0..57f2aacec97f5 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -700,7 +700,7 @@ static int copy_result_to_user(struct dlm_user_args *ua=
, int compat,
 =09result.version[0] =3D DLM_DEVICE_VERSION_MAJOR;
 =09result.version[1] =3D DLM_DEVICE_VERSION_MINOR;
 =09result.version[2] =3D DLM_DEVICE_VERSION_PATCH;
-=09memcpy(&result.lksb, &ua->lksb, sizeof(struct dlm_lksb));
+=09memcpy(&result.lksb, &ua->lksb, offsetof(struct dlm_lksb, sb_lvbptr));
 =09result.user_lksb =3D ua->user_lksb;
=20
 =09/* FIXME: dlm1 provides for the user's bastparam/addr to not be updated
--=20
2.20.1


