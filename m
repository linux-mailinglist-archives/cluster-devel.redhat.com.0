Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A24437E9F
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Oct 2021 21:26:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-V86CkSM5NwCwR4GBsMkpCg-1; Fri, 22 Oct 2021 15:26:44 -0400
X-MC-Unique: V86CkSM5NwCwR4GBsMkpCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DED11006AA3;
	Fri, 22 Oct 2021 19:26:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D89751037F37;
	Fri, 22 Oct 2021 19:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E34C4EA2F;
	Fri, 22 Oct 2021 19:26:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJNCgA014068 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:23:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEE4B40D1B9E; Fri, 22 Oct 2021 19:23:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5DE40C1257
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 19:23:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E6718812C7
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 19:23:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-qykIY0uuM6WS4lA6eAbJRg-1; Fri, 22 Oct 2021 15:23:10 -0400
X-MC-Unique: qykIY0uuM6WS4lA6eAbJRg-1
Received: by mail-lf1-f42.google.com with SMTP id i24so2584079lfj.13
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 12:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uFe3exnauQJfbAcR6oE2bmw1C/eF9vF+KK5HN22tWIw=;
	b=Q+F6bf27okbxzud7atD0dVAZwH5cntwyKz1JSVLC2G2bdmsEMfoUXO2cXY78oD7E9Z
	B+LZKJV8FxbuayyPUS2GldPFGYIMZVL432EG6RySDkgRKpdVDvLIaw1pPYWUlnFVqJyi
	1y4oBTDeKZ53/eaJZajj5EFmJ8+iEDxjHM5yTWRKX4a7qvkzNxsCuQtJWHjI6FsDbRn5
	Hi73ylYWVZRGzaTTUZplrQPAozNYFtA58SOKtohvhVDtBVxroBsEoFY8PgIklK6yN7Ht
	xX55NrWR3fpXqUE27vJQZKoAXM1KjpOw0Gl4nprLTL/fhBIx+N3UNPpiSQ9zM0qhT2c2
	doeg==
X-Gm-Message-State: AOAM5304vh7/u4/O2nr+3WltLrdq/Bd1wC+FJazJlWFP3fwBByMlblsC
	YMI81MuYctPpDyfWYwLgFqZGZSfEjga6dGX/
X-Google-Smtp-Source: ABdhPJwVeTmjC47goNNRoSELfEhrSZj7uk7MSi5vUOtHuT4SkMQNF9NzoBWF3e4HlZfFjP/v5t18Ng==
X-Received: by 2002:a05:6512:3da0:: with SMTP id
	k32mr1448467lfv.272.1634930588688; 
	Fri, 22 Oct 2021 12:23:08 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
	[209.85.167.48]) by smtp.gmail.com with ESMTPSA id
	bu35sm450979lfb.142.2021.10.22.12.23.07
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 22 Oct 2021 12:23:07 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id p16so1366037lfa.2
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 12:23:07 -0700 (PDT)
X-Received: by 2002:a05:6512:2245:: with SMTP id
	i5mr1384043lfu.655.1634930587026; 
	Fri, 22 Oct 2021 12:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
In-Reply-To: <YXL9tRher7QVmq6N@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Oct 2021 09:22:51 -1000
X-Gmail-Original-Message-ID: <CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
Message-ID: <CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 22, 2021 at 8:06 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Probing only the first byte(s) in fault_in() would be ideal, no need to
> go through all filesystems and try to change the uaccess/probing order.

Let's try that. Or rather: probing just the first page - since there
are users like that btrfs ioctl, and the direct-io path.

                  Linus

