Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 91B801D1DCE
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 20:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589395561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oGExS5qpyhaJE9sRdyvo65rhkDZrEjTLCCqtKDwIC/k=;
	b=L3l/M1DzYEqKrMPV4jixph3l9vKv4E06nI4ng5yM9ThuZ5aejpaFH6T9aa7dNXCWd7C81/
	qy4vt44MM1HnnMLgv8UNPzsf0s8Bym3pAt1nBGAKk9F27cMwJT6HnFgWq90IhnSJwOmWXU
	BgL3X/EYT4/0P5DnV3x5PHtbEIZ1qxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-sGECZZ83P-aGiEVHWx7-SA-1; Wed, 13 May 2020 14:46:00 -0400
X-MC-Unique: sGECZZ83P-aGiEVHWx7-SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED46835B44;
	Wed, 13 May 2020 18:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5F0761F3A;
	Wed, 13 May 2020 18:45:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49FD94E982;
	Wed, 13 May 2020 18:45:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DIjnOd019133 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 14:45:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C911F2166B27; Wed, 13 May 2020 18:45:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1262166BA3
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 18:45:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE0CB8007AC
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 18:45:46 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-86-KdBbEfVdPT6-M9nm3_X2Qw-1; Wed, 13 May 2020 14:45:44 -0400
X-MC-Unique: KdBbEfVdPT6-M9nm3_X2Qw-1
Received: by mail-pg1-f195.google.com with SMTP id u35so139338pgk.6;
	Wed, 13 May 2020 11:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oGExS5qpyhaJE9sRdyvo65rhkDZrEjTLCCqtKDwIC/k=;
	b=KCfK6L8Ur5bfdqD27KaqLNSlFWji6oeMqA/LhtEdj59tM3DRpBMl+hgBBnfb7vaa1P
	3XX6gkrp+2tsQy5K3+Rqv/bcK8vUw9i1ucLWCecxVfMRvfi5id27YIHOGUxtwo9jkIXt
	tQ0MsfHJw9WYKUgl1jNQ4izNZrH/PxtPZcPa2xJLvVFkBRLVxMu6eeWpFvN1OFKXAzM2
	OA31ucxB8V6Bj/PWFVBDSgBycjVtKNAJb6AJlYQjZnL/B9zOp3NKnX3xZ9iKgXRh5LKR
	UOZfniBN/I/F2rTCPUQ5ZxAuhbMU8h/hLZDwGtfOnVUjYoGd39jOXHArYguNjrzOWWJI
	mLiw==
X-Gm-Message-State: AOAM533TFU2XWLEvb/LNwdrAzSHsvGDy6H9ZsOo2cGx8YWExcfkPVrIa
	62U843XWlkBFNCdkoXtEwwE=
X-Google-Smtp-Source: ABdhPJxuCtZ6LqG/D7UsLLlMEE3Gj8Q00WqSwzmkuBnzsqf4vGt4xYIyJ/k3v57Ipr7A3TPHVfXEFQ==
X-Received: by 2002:a62:7d91:: with SMTP id y139mr631244pfc.172.1589395542971; 
	Wed, 13 May 2020 11:45:42 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:59e0:deac:a73c:5d11?
	([2601:647:4802:9070:59e0:deac:a73c:5d11])
	by smtp.gmail.com with ESMTPSA id
	g10sm238580pfk.103.2020.05.13.11.45.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 13 May 2020 11:45:41 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
References: <20200513062649.2100053-1-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <2c9a28f7-4268-2295-0d64-ada9178a5553@grimberg.me>
Date: Wed, 13 May 2020 11:45:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] remove kernel_setsockopt and kernel_getsockopt
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


> Hi Dave,
> 
> this series removes the kernel_setsockopt and kernel_getsockopt
> functions, and instead switches their users to small functions that
> implement setting (or in one case getting) a sockopt directly using
> a normal kernel function call with type safety and all the other
> benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation - counter to that a few kernel
> drivers just set the fields directly already.
> 
> Nevertheless the diffstat looks quite promising:
> 
>   42 files changed, 721 insertions(+), 799 deletions(-)

For the nvme-tcp bits,

Acked-by: Sagi Grimberg <sagi@grimberg.me>

