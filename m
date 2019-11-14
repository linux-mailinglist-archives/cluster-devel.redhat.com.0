Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D18AAFC492
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 11:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573728346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ufdTjtF3UsjseGK2x2A1ailA4QRSGy0OikSN9x3EL2s=;
	b=CGhY28ds/qgx6zBevRpsJ6RCEo3NPgg27GRYjshZRmMepqEsDVXthPzx+rjjVomUCX3yeb
	OjDfJLJ3up9DBR6IPx8oQhZHIzNJAuBgvN0oYABvsa8XxIo299vfQdzE607+9y6NMaL7i0
	BojtwPcUMHptpN0yxr6+K8xhr6r/dn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-C-V2l3edOcqdh46bUflzlg-1; Thu, 14 Nov 2019 05:45:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7E11107BAB7;
	Thu, 14 Nov 2019 10:45:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 786C56084E;
	Thu, 14 Nov 2019 10:45:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00165180880C;
	Thu, 14 Nov 2019 10:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEAjda6006008 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 05:45:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6B825F796; Thu, 14 Nov 2019 10:45:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17C825F76D;
	Thu, 14 Nov 2019 10:45:36 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
	<20191113213030.237431-31-rpeterso@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <a2bd4441-b9c5-fb44-ecf1-b7f2daac9698@redhat.com>
Date: Thu, 14 Nov 2019 10:45:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113213030.237431-31-rpeterso@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 30/32] gfs2: Don't demote a glock until
 its revokes are written
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: C-V2l3edOcqdh46bUflzlg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 13/11/2019 21:30, Bob Peterson wrote:
> Before this patch, run_queue would demote glocks based on whether
> there are any more holders. But if the glock has pending revokes that
> haven't been written to the media, giving up the glock might end in
> file system corruption if the revokes never get written due to
> io errors, node crashes and fences, etc. In that case, another node
> will replay the metadata blocks associated with the glock, but
> because the revoke was never written, it could replay that block
> even though the glock had since been granted to another node who
> might have made changes.
>
> This patch changes the logic in run_queue so that it never demotes
> a glock until its count of pending revokes reaches zero.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

I'm not sure this makes sense... if we demote the glock then the revokes=20
should be written out during that process. So if that is not happening=20
it is a bug. I don't think we should need to change the logic for=20
deciding what we are going to demote?

Steve.

> ---
>   fs/gfs2/glock.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index ab72797e3ba1..082f70eb96db 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -712,6 +712,9 @@ __acquires(&gl->gl_lockref.lock)
>   =09=09=09goto out_unlock;
>   =09=09if (nonblock)
>   =09=09=09goto out_sched;
> +=09=09smp_mb();
> +=09=09if (atomic_read(&gl->gl_revokes) !=3D 0)
> +=09=09=09goto out_sched;
>   =09=09set_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags);
>   =09=09GLOCK_BUG_ON(gl, gl->gl_demote_state =3D=3D LM_ST_EXCLUSIVE);
>   =09=09gl->gl_target =3D gl->gl_demote_state;

