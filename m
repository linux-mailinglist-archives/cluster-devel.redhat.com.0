Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 61C753B8539
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Jun 2021 16:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625064385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Y4vf1yqzrS3vFpHReQKYOpbBl+OSfAyb+Khv5JrEsWA=;
	b=P1oKUQ9RE5vndYfCKDwhPCplbe1amDWLM4B/WDz+vOE2BFU+trEMgOZQcEi6gHfKtEhtZp
	FS5K0YuOS5vFKcYcL2SJLnwTGgtZpL4h6U6Va8tPRAv/OFeZ87w20BM6hVUbeDTybyDxCs
	4cgpAKnYXn8HOOLtI4D/GOWzI4T5ang=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-HYG2lOqJP5aGopPJuWt4ig-1; Wed, 30 Jun 2021 10:46:24 -0400
X-MC-Unique: HYG2lOqJP5aGopPJuWt4ig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 793A31922964;
	Wed, 30 Jun 2021 14:46:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4168C60C13;
	Wed, 30 Jun 2021 14:46:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C5E71809C9A;
	Wed, 30 Jun 2021 14:46:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15UEk8dv007596 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Jun 2021 10:46:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 439A1F642D; Wed, 30 Jun 2021 14:46:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C365F8945
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 14:46:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20CAF80122D
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 14:46:00 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-P9860qj2OPunBh-za5p3Qg-1; Wed, 30 Jun 2021 10:45:58 -0400
X-MC-Unique: P9860qj2OPunBh-za5p3Qg-1
Received: by mail-wr1-f72.google.com with SMTP id
	p4-20020a5d63840000b0290126f2836a61so1068394wru.6
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 07:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y4vf1yqzrS3vFpHReQKYOpbBl+OSfAyb+Khv5JrEsWA=;
	b=RT17HoWUh8LnGiNqa67/I+exRs7RoRTCgvZre6NAI7YXx4Go2FbSW3PVUJk5mG1cWW
	YNODgkesb7296AjOrGM09NNFj5i7kqiI3FDoedqSlgSciAjIrQ1bkZKV9gLA24nZYoHZ
	b0NdUyZZGaY+wxRoMaXaC1TEWi5Szn18xYbNL4kHksqvPqZT8aIiaXqsscBa8Ub5EhY9
	DHkW7h/SbEh4XYdHCY8wdUMBxaK0luV1hR3z8VE05xusy7uob1DfN3i6ZOP+v5WxFeI7
	nshE83/D/eFZYAhyg0xyVeVsWdfdeaaILy3UA+4I08k9DQt/DCF+PNX9LHL9WooA5Vdg
	VdYw==
X-Gm-Message-State: AOAM531jg9H1x41Cp3g7OM7eLqRqtKm1Tc/Nc8thpfmcDmQ9z1S1UiSC
	MoQOhUR+hEYjOELfm2meJG2o4LY0fyP9aTOSPXfzj5gFi8D1WS8vR5KVbW9nGVsAGdIDAaEDUI/
	APWGTt4jURS+gSmDCPQzb3uUyi9G1fl3RMwkUHw==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr13230654wrw.329.1625064357357; 
	Wed, 30 Jun 2021 07:45:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgU5oFUHVMXKdZBHHmE78pYqUjAWgIPUUXK096keRw4Ekq8bzPm3W555Qgaz0gc7LPesnRODsUtpLUc8qY2+Y=
X-Received: by 2002:a5d:5745:: with SMTP id q5mr13230628wrw.329.1625064357193; 
	Wed, 30 Jun 2021 07:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <YNoJPZ4NWiqok/by@casper.infradead.org>
	<20210628172727.1894503-1-agruenba@redhat.com>
	<20210629091239.1930040-1-agruenba@redhat.com>
	<YNx69luCAxlLMDAG@casper.infradead.org>
In-Reply-To: <YNx69luCAxlLMDAG@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 30 Jun 2021 16:45:45 +0200
Message-ID: <CAHc6FU4_eQMQinMfTHG42phuW6r7PTtyecDfMESp-KziaicL8w@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-xfs@vger.kernel.org,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 4:09 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Jun 29, 2021 at 11:12:39AM +0200, Andreas Gruenbacher wrote:
> > Below is a version of your patch on top of v5.13 which has passed some
> > local testing here.
> >
> > Thanks,
> > Andreas
> >
> > --
> >
> > iomap: Permit pages without an iop to enter writeback
> >
> > Permit pages without an iop to enter writeback and create an iop *then*.  This
> > allows filesystems to mark pages dirty without having to worry about how the
> > iop block tracking is implemented.
>
> How about ...
>
> Create an iop in the writeback path if one doesn't exist.  This allows
> us to avoid creating the iop in some cases.  The only current case we
> do that for is pages with inline data, but it can be extended to pages
> which are entirely within an extent.  It also allows for an iop to be
> removed from pages in the future (eg page split).
>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> Co-developed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Sure, that works for me.

Thanks,
Andreas

