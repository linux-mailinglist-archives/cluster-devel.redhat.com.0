Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CAABE274A6D
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Sep 2020 22:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600808171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Dt4lawrM4bpauFnFVjp1hcANwwEt5xUBEAwKrSkSD9Y=;
	b=SZKEby2uRNOXdJwmZUL9Xd11M7uLgZIVbY7bml9f53P+I09B0qJx+1QUMeTeUh5FRryQhj
	im4S8J26P7zFvBjVydiC+dsI9IhThrAGtsEthwAsH50jlbygvtnPgq4QbfRzTMTm63aID1
	Nzsw3dYWjKDTrxnyKYWCWahVBptsuHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221--kbr679hMf-W0FKiYH_E6w-1; Tue, 22 Sep 2020 16:56:10 -0400
X-MC-Unique: -kbr679hMf-W0FKiYH_E6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59394186DD38;
	Tue, 22 Sep 2020 20:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5586078808;
	Tue, 22 Sep 2020 20:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB4D38C7AD;
	Tue, 22 Sep 2020 20:56:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MKqWTW015954 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 16:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F12A10F26FE; Tue, 22 Sep 2020 20:52:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 889C410F26FC
	for <cluster-devel@redhat.com>; Tue, 22 Sep 2020 20:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73941800962
	for <cluster-devel@redhat.com>; Tue, 22 Sep 2020 20:52:29 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-494-pTQMNoIFOlq-nTvwwGMS9Q-1; Tue, 22 Sep 2020 16:52:27 -0400
X-MC-Unique: pTQMNoIFOlq-nTvwwGMS9Q-1
Received: by mail-il1-f197.google.com with SMTP id w6so15491038ilo.13
	for <cluster-devel@redhat.com>; Tue, 22 Sep 2020 13:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dt4lawrM4bpauFnFVjp1hcANwwEt5xUBEAwKrSkSD9Y=;
	b=AEcAcCWo4YWgp0y8cLClPKt5UShZgr7Z3FaxBqi0buZ1ZUPvca4DUxjGRK7v4RPPvX
	BSTyWWIx0SnLIv3Fn6YgkE1HTgAHXkV+jroOFl4eKJ3IVg/tslxhFoU0UkcyYprRVkf2
	9kuTua+Dsg97pNPeauukrX4iKXaxCeWNrRVGPQ6wnn4Of6nZ9GA5iWihLHvEzaPETBaf
	EBoAVYvqzZHjHeiHY1Ah4qdqpMoBEjl3Dq5SmcjxQZg5gf1ZhEszjuTDZmB3WiS56FFs
	qvln9ARQcZU8rux/hE2miMR779VSkHPOU4mcKAReiHcIPSn7A2LwSaBzCx1gqp6iMuny
	p6/g==
X-Gm-Message-State: AOAM530gs46rFOgagQOYsph5Seumn6QkRmHkYIRLFYzL77rUWLlBRT6V
	FYn0Am4SzOQYG10N14IwbCAMu03t1C0kbKUfFatIlWjR5fsFkac/ElmJDz7S4yfr7daUYnjHBFa
	ux8O+6yks6b2pej0YbIpCjdssXW1C/KVFXnwONg==
X-Received: by 2002:a02:c72c:: with SMTP id h12mr5728223jao.86.1600807946128; 
	Tue, 22 Sep 2020 13:52:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNbf52zTHj1YIjQObC03lJf2i+ENdZrNlgpbmnASv0OSaXvzUgzY+uh/qVJJi7Nn14ng8kmDpkCK3brsYwWhU=
X-Received: by 2002:a02:c72c:: with SMTP id h12mr5728208jao.86.1600807945897; 
	Tue, 22 Sep 2020 13:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200918142728.147392-1-aahringo@redhat.com>
In-Reply-To: <20200918142728.147392-1-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Tue, 22 Sep 2020 16:52:15 -0400
Message-ID: <CAK-6q+jxGmzdKtn9ANFxmC53BC=iSnLci25z40zQsnmC=Mu7yA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm/next 0/6] fs: dlm: rework receive
 and transmit handling
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Fri, Sep 18, 2020 at 10:27 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> This patch series contains a huge change regarding to the
> receive/transmit handling of dlm. As I placed sequence numbering on dlm
> messages I expierenced that dlm messages can be transmitted in an
> incorrect order. I changed the transmit handling that the writequeue
> handles entries per dlm message buffer and sendmsg() will use
> scatter/gather to transmit a bunch of them. At the receive handling I
> removed some allocations and copies into different buffers. There is
> only one receive buffer now which fill be get filled and the upper layer
> will working on that buffer as well.

I got a review today and we should stick to sendpage() functionality.
Please wait for a resend of v2. Meanwhile I also detected issues with
the mark handling which I want to fix as well.

Thanks.

- Alex

