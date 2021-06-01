Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F839396CF9
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Jun 2021 07:48:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-35RJyF9_NGKqNFjeSrBUig-1; Tue, 01 Jun 2021 01:48:04 -0400
X-MC-Unique: 35RJyF9_NGKqNFjeSrBUig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07C9C107ACE4;
	Tue,  1 Jun 2021 05:48:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61B7F100EBAF;
	Tue,  1 Jun 2021 05:48:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5209644A58;
	Tue,  1 Jun 2021 05:47:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1515lqnI013185 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Jun 2021 01:47:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F197E2039DA6; Tue,  1 Jun 2021 05:47:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1D62039DA5
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 05:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39AE3857D08
	for <cluster-devel@redhat.com>; Tue,  1 Jun 2021 05:47:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-VFlPXYrXOhal7xQg13mYMQ-1; Tue, 01 Jun 2021 01:47:47 -0400
X-MC-Unique: VFlPXYrXOhal7xQg13mYMQ-1
Received: by mail-lj1-f177.google.com with SMTP id s25so17565220ljo.11
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 22:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rVw8no+yV8oB3wz5djeZPnCWS3j2O3cetrETqnASBLc=;
	b=TkijiIlVznsJiNwfHT8rfBy4XJBa93eFf3l06HDeUqjEDELo+orUv/k/cM7oWUi/qV
	o70v8zQd9z6hqBYqjnPlph13VXg4zMeaauYw2XeYzUcSZtY/8vk59yFbSH7LN282P1uX
	uh4Q5feMY//UhdglhsF97G23kXeOrCDlC7HHj7fwF8lOCZyfiAEPPDioiH5sR6DduBx0
	k6jQIjXK1ZnKMPb6/K0658PcoOSvcc7HLsHgE/UDkfKFj2R/K+2LnFXSxjKaI+P8k1xK
	Lt6iEBI+lj8dkEyUJ3RMnp5400qWGOXvsTkxOd4AqXSM5xozNHXus5men9ayRiCGTjA7
	zLWA==
X-Gm-Message-State: AOAM532inPXQ6L4Bp/VAckQSo9rf7zxy6Du+IAcelIDY4PTJECP7jeMO
	pOrq3OuCHzvWOdpV5dIcA9zwqQJvEDrISeos
X-Google-Smtp-Source: ABdhPJym1vIQYV/1qvtl/vHQbWOZZZD2mJ//UUdzAZPAtEaVTUxh8bj2LFdVEJcDmKHdsSieNQIVPw==
X-Received: by 2002:a05:651c:1189:: with SMTP id
	w9mr19570841ljo.4.1622526465321; 
	Mon, 31 May 2021 22:47:45 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
	[209.85.167.52]) by smtp.gmail.com with ESMTPSA id
	d19sm1887830ljg.52.2021.05.31.22.47.44 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 31 May 2021 22:47:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id v8so19906436lft.8
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 22:47:44 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id
	x2mr11242558lfa.421.1622526464531; 
	Mon, 31 May 2021 22:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-10-agruenba@redhat.com>
In-Reply-To: <20210531170123.243771-10-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 May 2021 19:47:28 -1000
X-Gmail-Original-Message-ID: <CAHk-=whZWgwbyXMdC0JE+dM0zLyG1TU4gyAxv0FxbwZPwaEX7Q@mail.gmail.com>
Message-ID: <CAHk-=whZWgwbyXMdC0JE+dM0zLyG1TU4gyAxv0FxbwZPwaEX7Q@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [RFC 9/9] gfs2: Fix mmap + page fault deadlocks
	(part 2)
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

On Mon, May 31, 2021 at 7:02 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> @@ -807,13 +824,20 @@ static ssize_t gfs2_file_direct_read(struct kiocb *iocb, struct iov_iter *to,
> [...]
>         ret = iomap_dio_rw(iocb, to, &gfs2_iomap_ops, NULL, 0);
>         gfs2_glock_dq(gh);
> +       if (unlikely(current_needs_retry())) {
> +               set_current_needs_retry(false);
> +               if (ret == -EFAULT &&
> +                   !iov_iter_fault_in_writeable(to, PAGE_SIZE))
> +                       goto retry;
> +       }

Hmm. I haven't walked through this all, but is that "ret == -EFAULT"
test the right thing to do?

Can iomap_dio_rw() not instead just return a partial success if it hit
a missing page half-way?

Shouldn't you retry for that case too?

                Linus

