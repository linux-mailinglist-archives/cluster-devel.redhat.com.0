Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2B46D978
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Dec 2021 18:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638983794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FEanbHU4eP5wbLJkWaUtt6vOjpQz9Raqg814jSd/lxA=;
	b=XbQqekzhE6TdGeJLa/Ezg1MQYw2gHGDTe8KlR0I6faOZ1V0xdmPpn3nsXcoBCJiu+ykVnl
	+fAbA5OIC25n+NNoPBNN8IG2lYno3NrzulGZ7y3DBJJvo7GRa474M8Y5GoGNJ4eUoba091
	3GYRIiJVjEmwIcahUS2KOFqn07Bb8TU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Ow-1BP4sOeusqtFdDDRLDA-1; Wed, 08 Dec 2021 12:16:31 -0500
X-MC-Unique: Ow-1BP4sOeusqtFdDDRLDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 494EF100CCC2;
	Wed,  8 Dec 2021 17:16:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329A2196E2;
	Wed,  8 Dec 2021 17:16:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CC354BB7C;
	Wed,  8 Dec 2021 17:16:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8HEGcO009540 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 12:14:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B43A492CA4; Wed,  8 Dec 2021 17:14:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07009492CA3
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:14:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFC853C11D27
	for <cluster-devel@redhat.com>; Wed,  8 Dec 2021 17:14:15 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-271-5edurPBVOuKu_IsYnnc7JQ-1; Wed, 08 Dec 2021 12:14:14 -0500
X-MC-Unique: 5edurPBVOuKu_IsYnnc7JQ-1
Received: by mail-wm1-f70.google.com with SMTP id
	138-20020a1c0090000000b00338bb803204so1618689wma.1
	for <cluster-devel@redhat.com>; Wed, 08 Dec 2021 09:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=FEanbHU4eP5wbLJkWaUtt6vOjpQz9Raqg814jSd/lxA=;
	b=MHQmMt6S3qV9vn/Qdfl8q2H12p9CsAve9LLOd8mgNTCsOteuwrn0W5XPt/Fi3lqgSu
	K6ad+QJAhMvM51K0aozC1OEwufo9SlEliFqh9u2qv5CiQF3Cz/l6E+kXloA0XaaS/mZQ
	47uZ3QvAkIktqJK72fVfsEhOwZQCMoMRQhzD5fdteBK4W2FPwp5HJB8RbKP09TkVVUbl
	Sv2lqpcB+pCeDK3LtTZK2IZdT6ZTdGzHIkZTl3oc4l7WS/WeXIdTIbl4x9hZe8lZdy1x
	yuUqiBz71h3cWsFYU+6bPzLcEs2FPxafAxLgeXvmTqd//P9EBj0ACsamyudtzlp+ppqw
	adVA==
X-Gm-Message-State: AOAM5321CwOir/nRr7A/309oG2WeeijDfqKWe2cAgROXZ/F7zaFYRUhq
	Ncy9jV0kGUW41w0yagSEVjALZ9ZMB+WPLIU+TfveDSc5t9G8cUSahJM0jrK/zbs3pEeUNPSmbDC
	VuLm3dukp74WNBd14YOWFpA==
X-Received: by 2002:a5d:5251:: with SMTP id k17mr60233905wrc.482.1638983653496;
	Wed, 08 Dec 2021 09:14:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz45wAwpgoodiEVVq5eazLvco4r3od7fxbepB7ZWAUIOQJY2r015sNyv7/p49/W/JeUH0911Q==
X-Received: by 2002:a5d:5251:: with SMTP id k17mr60233881wrc.482.1638983653293;
	Wed, 08 Dec 2021 09:14:13 -0800 (PST)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	138sm6490122wma.17.2021.12.08.09.14.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Dec 2021 09:14:13 -0800 (PST)
Message-ID: <db467645f7fe42760197c0f692b098d3d40b9550.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>,
	cluster-devel@redhat.com
Date: Wed, 08 Dec 2021 17:14:12 +0000
In-Reply-To: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
References: <398059639.62550733.1638982241202.JavaMail.zimbra@helmholtz-muenchen.de>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] message in syslog: shrink_slab:
 gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects to delete
 nr=xxxxxxxxxxxx
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2021-12-08 at 17:50 +0100, Lentes, Bernd wrote:
> Hi,
> 
> i hope this is the right place for asking about GFS2.
> Yesterday one of my two nodes HA-cluster got slower and slower, until
> it was fenced.
> In /var/log/messages i found this message repeated often before the
> system got slower:
> shrink_slab: gfs2_glock_shrink_scan+0x0/0x240 [gfs2] negative objects
> to delete nr=xxxxxxxxxxxx
> What does it mean ? Is it a problem ?
> 
> My Setup:
> SuSE SLES 12 SP5
> Kernel 4.12.14-122.46-default
> Pacemaker 1.1.23
> corosync 2.3.6-9.13.1
> gfs2-utils-3.1.6-1.101.x86_64
> 
> Thanks.
> 
> Bernd
> 

That message in itself is a consequence of (I believe) a race relating
to shrinking of that slab cache, but it is harmless. However the fact
that you've seen it suggests that the system might be short on free
memory. So I would check to see if a process is hogging memory as that
would explain the slowness too,

Steve.


