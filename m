Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C01C2B2488
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Nov 2020 20:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605295987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MiBlCezFpLS5h5XLi1/DW9QBkBSpyRXGeR8tWjARAIk=;
	b=in/TymVUMXiXa6zZZ04zaLWrN/8R8Fj62eXeq1RL4PXOgHKr2qH1Cp2QTjeRzMyseugYvL
	cFhcy3RMCE5do/rq5vKN8X4C6QbCgsDr+gYzbB/kFSJ++6O89tuVrUmDfdofusM4Y4XLIA
	UGcERqfDtE/YbL5PgIcziEusNc/P1ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-g8tP9da5Ob-FfPqNnOcwCg-1; Fri, 13 Nov 2020 14:33:05 -0500
X-MC-Unique: g8tP9da5Ob-FfPqNnOcwCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 647C2800462;
	Fri, 13 Nov 2020 19:33:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5AE19C66;
	Fri, 13 Nov 2020 19:32:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83F2718199F8;
	Fri, 13 Nov 2020 19:32:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADJUj6n016672 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 14:30:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 12A0E205EAE6; Fri, 13 Nov 2020 19:30:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3F22023438
	for <cluster-devel@redhat.com>; Fri, 13 Nov 2020 19:30:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB48811E78
	for <cluster-devel@redhat.com>; Fri, 13 Nov 2020 19:30:42 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-dkxJLbt0M3u0Is6EdAR39w-1; Fri, 13 Nov 2020 14:30:40 -0500
X-MC-Unique: dkxJLbt0M3u0Is6EdAR39w-1
Received: by mail-wr1-f69.google.com with SMTP id d8so4424846wrr.10
	for <cluster-devel@redhat.com>; Fri, 13 Nov 2020 11:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MiBlCezFpLS5h5XLi1/DW9QBkBSpyRXGeR8tWjARAIk=;
	b=ccJoStqn0MXyzYYt4jfALdDo4PVwSXYMPO1igZTH5v0Q1n1R8eSeHz7Q7l5KPXM4FV
	gNTXHhApUsjcCCXP06sOXJxMFrg2iqp5oZ+kmITPnBDhSKyf+u7WN2ZUF7klnXm9CJaO
	hjfXbghhBdlVF60IxOQlw55/e64c+blPEA8LQRhoSUR8xhCjB3ba1s3zk5EwKHrlrGiq
	Y6gNzyEw3n98XxvliRmrW1uN387r7pcJhDnSAiDz0T0Dz/c+bgctoEOU0funPV0lwb1M
	gpkCIcBAhcPiOroTq7WrRkY16w+8A5AkhCKRItW130po6gQxMp6QcNKwQHMq2goXpkIv
	9Orw==
X-Gm-Message-State: AOAM532hYZjDYOow2d0B0gbO8kZ8Bp711S3er+R/Wl/IyLJAkPH7Mdrm
	FWWSpcUihvTv7nkMpPrDvVnEBrzF23RiMLW4OMSqRqrAWfOkO9S9k6prtpKVFp7k130cmJ7A302
	NBfOOCiKDCWrwcL9X6aPHP6iAskgKx6O/DEO+nQ==
X-Received: by 2002:adf:9124:: with SMTP id j33mr5177528wrj.376.1605295839534; 
	Fri, 13 Nov 2020 11:30:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJSPfShxOP6RQoqBsPkLTT91qzc6D5AdZWATuziUUEiaTVWwpQBSucZybC6q5Wfju28h8+NvER1At7oep5dz0=
X-Received: by 2002:adf:9124:: with SMTP id j33mr5177516wrj.376.1605295839375; 
	Fri, 13 Nov 2020 11:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20201104162915.241765-1-anprice@redhat.com>
In-Reply-To: <20201104162915.241765-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 13 Nov 2020 20:30:28 +0100
Message-ID: <CAHc6FU7UVPXZ2eoxB=GGxn+LjaPjMLmdwnDpP4jazB3h8HROmg@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] Documentation: Update
	filesystems/gfs2.rst
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 5:32 PM Andrew Price <anprice@redhat.com> wrote:
> Remove an obsolete URL and generally bring the doc up-to-date

Applied to for-next, thanks.

Andreas

