Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3989913C83C
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 16:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579103016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GgfBBfqn0vedCkNHTdmSsWwTEIz5zHCGZfXyVn+Qs90=;
	b=MYwUu1TJL73+G4+qhWh3nsZEdA3oXINPQTln6pT3udryMb80FGPu3G5glhkWsUfJpgSlyi
	hc3pqS/iclRUnJhKj4BOf7pqpWeSbVjdcz5Gpa8Emhlv7w6EKY5ALP9kUzIHhCV2AfzZaG
	4SSlSO4nr01G83+iJ9Z0HJfePyLEZ3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Fk2yuVP-OWiTHWIdNeSafw-1; Wed, 15 Jan 2020 10:43:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 884AF10FA601;
	Wed, 15 Jan 2020 15:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AC28675AE;
	Wed, 15 Jan 2020 15:43:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 994FF820F9;
	Wed, 15 Jan 2020 15:43:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FFhRPV013206 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 10:43:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F6467BA54; Wed, 15 Jan 2020 15:43:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.62] (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E646675AE;
	Wed, 15 Jan 2020 15:43:23 +0000 (UTC)
To: Steven Whitehouse <swhiteho@redhat.com>, cluster-devel@redhat.com
References: <20200115084956.7405-1-agruenba@redhat.com>
	<d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <390a75f4-50ba-ae19-c802-f2e3d0232350@redhat.com>
Date: Wed, 15 Jan 2020 15:43:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <d7d86bca-522a-48f5-bee3-bae50cd04485@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] Move struct gfs2_rgrp_lvb out of
 gfs2_ondisk.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Fk2yuVP-OWiTHWIdNeSafw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15/01/2020 08:58, Steven Whitehouse wrote:
> Hi,
>=20
> On 15/01/2020 08:49, Andreas Gruenbacher wrote:
>> There's no point in sharing the internal structure of lock value blocks
>> with user space.
>=20
> The reason that is in ondisk is that changing that structure is=20
> something that needs to follow the same rules as changing the on disk=20
> structures. So it is there as a reminder of that,

Perhaps some eye-catching code comments would suffice? Defining it in a=20
uapi header does sort-of communicate that it's ok to use in userspace,=20
whereas just having the structs in close proximity doesn't really=20
communicate that they should be updated in sync.

Andy

>=20
>>
>> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>> ---
>> =C2=A0 fs/gfs2/glock.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 fs/gfs2/incore.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 fs/gfs2/rgrp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
>> =C2=A0 include/uapi/linux/gfs2_ondisk.h | 10 ----------
>> =C2=A0 4 files changed, 12 insertions(+), 10 deletions(-)
>>

>=20
> Steve.
>=20
>> diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
>> index b8adaf80e4c5..d2f2dba05a94 100644
>> --- a/fs/gfs2/glock.h
>> +++ b/fs/gfs2/glock.h
>> @@ -306,4 +306,5 @@ static inline void glock_clear_object(struct=20
>> gfs2_glock *gl, void *object)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&gl->gl_lockref.lock);
>> =C2=A0 }
>> +
>> =C2=A0 #endif /* __GLOCK_DOT_H__ */
>> diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
>> index b5d9c11f4901..5155389e9b5c 100644
>> --- a/fs/gfs2/incore.h
>> +++ b/fs/gfs2/incore.h
>> @@ -33,6 +33,7 @@ struct gfs2_trans;
>> =C2=A0 struct gfs2_jdesc;
>> =C2=A0 struct gfs2_sbd;
>> =C2=A0 struct lm_lockops;
>> +struct gfs2_rgrp_lvb;
>> =C2=A0 typedef void (*gfs2_glop_bh_t) (struct gfs2_glock *gl, unsigned i=
nt=20
>> ret);
>> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
>> index 2466bb44a23c..1165627274cf 100644
>> --- a/fs/gfs2/rgrp.c
>> +++ b/fs/gfs2/rgrp.c
>> @@ -46,6 +46,16 @@
>> =C2=A0 #define LBITSKIP00 (0x0000000000000000UL)
>> =C2=A0 #endif
>> +struct gfs2_rgrp_lvb {
>> +=C2=A0=C2=A0=C2=A0 __be32 rl_magic;
>> +=C2=A0=C2=A0=C2=A0 __be32 rl_flags;
>> +=C2=A0=C2=A0=C2=A0 __be32 rl_free;
>> +=C2=A0=C2=A0=C2=A0 __be32 rl_dinodes;
>> +=C2=A0=C2=A0=C2=A0 __be64 rl_igeneration;
>> +=C2=A0=C2=A0=C2=A0 __be32 rl_unlinked;
>> +=C2=A0=C2=A0=C2=A0 __be32 __pad;
>> +};
>> +
>> =C2=A0 /*
>> =C2=A0=C2=A0 * These routines are used by the resource group routines (r=
grp.c)
>> =C2=A0=C2=A0 * to keep track of block allocation.=C2=A0 Each block is re=
presented by two
>> diff --git a/include/uapi/linux/gfs2_ondisk.h=20
>> b/include/uapi/linux/gfs2_ondisk.h
>> index 2dc10a034de1..4e9a80941bec 100644
>> --- a/include/uapi/linux/gfs2_ondisk.h
>> +++ b/include/uapi/linux/gfs2_ondisk.h
>> @@ -171,16 +171,6 @@ struct gfs2_rindex {
>> =C2=A0 #define GFS2_RGF_NOALLOC=C2=A0=C2=A0=C2=A0 0x00000008
>> =C2=A0 #define GFS2_RGF_TRIMMED=C2=A0=C2=A0=C2=A0 0x00000010
>> -struct gfs2_rgrp_lvb {
>> -=C2=A0=C2=A0=C2=A0 __be32 rl_magic;
>> -=C2=A0=C2=A0=C2=A0 __be32 rl_flags;
>> -=C2=A0=C2=A0=C2=A0 __be32 rl_free;
>> -=C2=A0=C2=A0=C2=A0 __be32 rl_dinodes;
>> -=C2=A0=C2=A0=C2=A0 __be64 rl_igeneration;
>> -=C2=A0=C2=A0=C2=A0 __be32 rl_unlinked;
>> -=C2=A0=C2=A0=C2=A0 __be32 __pad;
>> -};
>> -
>> =C2=A0 struct gfs2_rgrp {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gfs2_meta_header rg_header;
>=20

