Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB6162835FE
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Oct 2020 15:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601902813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=x7QPPNUTCaSWIZPB/ju4HImGo/gOqjVPUMvGsrjSBRM=;
	b=QPb4QvrzlPvEQOzqJvviJLSrfn6UwQVnjy9RYVYDnBVMG2F0f2VwlJtfFdxTJaCKDOO48Q
	IGgS6jeak7eO9h5nIQbvknPipMb/3BlF2JGWgpyyn6QRxJeEM/VSsSCoeEH8Mn33qjDbXD
	BC4gZkwIUoy5bHs5hayeftcNuXX2NXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-AyoV8atwNs-FOfTNZUetzg-1; Mon, 05 Oct 2020 09:00:12 -0400
X-MC-Unique: AyoV8atwNs-FOfTNZUetzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BECBD107ACF6;
	Mon,  5 Oct 2020 13:00:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFE775123;
	Mon,  5 Oct 2020 13:00:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92B27181A71E;
	Mon,  5 Oct 2020 13:00:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095D010Z005804 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 09:00:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51A0946AA; Mon,  5 Oct 2020 13:00:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD773946B9
	for <cluster-devel@redhat.com>; Mon,  5 Oct 2020 12:59:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47AD0185A78B
	for <cluster-devel@redhat.com>; Mon,  5 Oct 2020 12:59:59 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-534-VXyxvua0MoSLPb0iWC_Clg-1; Mon, 05 Oct 2020 08:59:57 -0400
X-MC-Unique: VXyxvua0MoSLPb0iWC_Clg-1
Received: by mail-wr1-f71.google.com with SMTP id o6so3965100wrp.1
	for <cluster-devel@redhat.com>; Mon, 05 Oct 2020 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x7QPPNUTCaSWIZPB/ju4HImGo/gOqjVPUMvGsrjSBRM=;
	b=YOfTX7EFt1vMPL7rC5uw7scpLsRffdTY32FcO1pm4Y04/SCw+zaniXiBzKIMcasTO8
	hqGtGzvJzZ3/FtndLK20oNk/Nx/w90k32rZ64ruukykNDDSDj9SLIKR3LXrKrFSZpqNv
	ml9tLX3BCwKIVYNs1HQLejeJvzeay22DZlXEIAAH2BV3YPGwF2oNeO3ybdrMhS5Rr2YO
	88PPPGqSXWQHTTbWrR6YqopCJrRNDSoJ8ym6K5+A1z0pU9EbIqDUTiEdxMLPWPX3PQ4z
	rd6GfDP70ydJty3DO19Dh2peyBjMyWeAN0e35cK2CZjpDYkycxmWu5D8M/1zxfqGl/i4
	nloQ==
X-Gm-Message-State: AOAM533pjXwTTTj9sFu95krIXVgZvgo/fU9n/ZmSHJHggJcJszj+blWX
	wWYAuBSgMDV9cLPI7MHqy/MK2tNqwFXvaPq67ROF0x+w+KbjvkLoq65uPh+Ghy5k33BhBFRnk54
	yaDuWys8Ta8Xyi5oBgG6v8jW6GGJTSDqU8FT4RQ==
X-Received: by 2002:a1c:b40b:: with SMTP id d11mr11275483wmf.152.1601902795887;
	Mon, 05 Oct 2020 05:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4hxQWHIG5sEkr7qJpu1eFp9BDYMA93jUhI2KXY8YUaEdNsvYM/MXWprVTBQPZx+qivjKOkAq6RZb3jjKD8QE=
X-Received: by 2002:a1c:b40b:: with SMTP id d11mr11275462wmf.152.1601902795672;
	Mon, 05 Oct 2020 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201003063143.13093-1-foxhlchen@gmail.com>
In-Reply-To: <20201003063143.13093-1-foxhlchen@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 5 Oct 2020 14:59:44 +0200
Message-ID: <CAHc6FU4--0duukwCutZGct_0hgrkCr3Rcje6QRWVwM7rdDTsjQ@mail.gmail.com>
To: Fox Chen <foxhlchen@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: gfs2_read_sb: put gfs2_assert
	inside the loop
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Fox Chen,

On Sat, Oct 3, 2020 at 8:33 AM Fox Chen <foxhlchen@gmail.com> wrote:
> Before this patch, gfs2_assert is put outside of the loop of
> sdp->sd_heightsize[x] calculation. When something goes wrong,
> x exceeds the size of GFS2_MAX_META_HEIGHT, it may already crash inside
> the loop when
>
> sdp->sd_heightsize[x] = space
>
> tries to reach the out-of-bound
> location, gfs2_assert won't help here.

that's true, but the smallest possible block size is 1024 bytes, and
with that, the height cannot grow bigger than 10. So the assert is
basically there only for documentation purposes.

Thanks,
Andreas

