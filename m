Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B187405BF4
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Sep 2021 19:23:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-_GZd_yJXP0qtTltI1_rH-w-1; Thu, 09 Sep 2021 13:23:24 -0400
X-MC-Unique: _GZd_yJXP0qtTltI1_rH-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53ACC802935;
	Thu,  9 Sep 2021 17:23:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3596F60C82;
	Thu,  9 Sep 2021 17:23:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10F361800FE4;
	Thu,  9 Sep 2021 17:23:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 189HNHtQ016058 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Sep 2021 13:23:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09A5D2051B78; Thu,  9 Sep 2021 17:23:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04F5B204FF25
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 17:23:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E167110665A3
	for <cluster-devel@redhat.com>; Thu,  9 Sep 2021 17:23:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-H2EaK235Mcm2MSbrX45mrw-1; Thu, 09 Sep 2021 13:23:15 -0400
X-MC-Unique: H2EaK235Mcm2MSbrX45mrw-1
Received: by mail-lj1-f176.google.com with SMTP id m4so4139840ljq.8
	for <cluster-devel@redhat.com>; Thu, 09 Sep 2021 10:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p6IJpdyTV9RM1+HAVghvZCBeKL8NDMdT8/thsJ+vYl0=;
	b=aXua5svtbHa4mKABGAvEXFVgcXxizZD+7K25Ul92jo7rjUMiHv5hdeqirhqpu0kIzd
	ucgDXamxnGk0UADyJpKuYVqrCvwjeBO4ZlHUXefZ4ODSH0xqeC7DzBiF1O5/ylc3kEuI
	VxZQWFIgSyQ9vscp82XiBIPQl0hpGwim4T8iVMo8GgMQWoQdS35JUK2KHUe6E4emnwH2
	VLqkxmf+geuSDignG2JHZBce991LO20+fcs9QI7BRXZlCG25tyNkiha8v9yhaljnZhce
	3CM3QSWzyVjLZ8vj/tAK2YCMnbMGFmo4D9/0xfK3ddsBBYHTrB1KrjqF1EkPykzb6BrP
	+EWA==
X-Gm-Message-State: AOAM5309s7Oqi4EgG0+xCTrnfxCKRSMn1tZP9lAuVoEUf5Zk49HiM5y9
	PUuO8zWoTnRsytc///Xq27eEKWuehUDlqcnDLO0=
X-Google-Smtp-Source: ABdhPJzD+HqWYgyrDIJlTk4JBn/rkfy+kyhL8BoyHrW/jCGjMClmvsireZyJeiUa5g3t24fHGQdCAw==
X-Received: by 2002:a2e:90da:: with SMTP id o26mr789299ljg.504.1631208193428; 
	Thu, 09 Sep 2021 10:23:13 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
	[209.85.208.182])
	by smtp.gmail.com with ESMTPSA id a17sm260498lfb.91.2021.09.09.10.23.12
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Sep 2021 10:23:12 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id w4so4118689ljh.13
	for <cluster-devel@redhat.com>; Thu, 09 Sep 2021 10:23:12 -0700 (PDT)
X-Received: by 2002:a2e:a363:: with SMTP id i3mr806608ljn.56.1631208192152;
	Thu, 09 Sep 2021 10:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<YTnwZU8Q0eqBccmM@infradead.org>
In-Reply-To: <YTnwZU8Q0eqBccmM@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 10:22:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgF7TPaumMU6HjBjawjFWjvEg=116=gtnzsxAcfdP4wAw@mail.gmail.com>
Message-ID: <CAHk-=wgF7TPaumMU6HjBjawjFWjvEg=116=gtnzsxAcfdP4wAw@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 16/19] iomap: Add done_before
	argument to iomap_dio_rw
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

On Thu, Sep 9, 2021 at 4:31 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> What about just passing done_before as an argument to
> iomap_dio_complete? gfs2 would have to switch to __iomap_dio_rw +
> iomap_dio_complete instead of iomap_dio_rw for that, and it obviously
> won't work for async completions, but you force sync in this case
> anyway, right?

I think you misunderstand.

Or maybe I do.

It very much doesn't force sync in this case. It did the *first* part
of it synchronously, but then it wants to continue with that async
part for the rest, and very much do that async completion.

And that's why it wants to add that "I already did X much of the
work", exactly so that the async completion can report the full end
result.

But maybe now it's me who is misunderstanding.

          Linus

