Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 37AB03FA18B
	for <lists+cluster-devel@lfdr.de>; Sat, 28 Aug 2021 00:35:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Mk6zWYHaNDaj3CxDq0RXrg-1; Fri, 27 Aug 2021 18:35:43 -0400
X-MC-Unique: Mk6zWYHaNDaj3CxDq0RXrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4CA107ACF5;
	Fri, 27 Aug 2021 22:35:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 879F9100AE35;
	Fri, 27 Aug 2021 22:35:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A55D04BB7C;
	Fri, 27 Aug 2021 22:35:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RMZUnv002576 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 18:35:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C46C22068553; Fri, 27 Aug 2021 22:35:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4CF2068551
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 22:35:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFA68811E7A
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 22:35:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-nLbKKyZAPfGZ_03F7RNIqA-1; Fri, 27 Aug 2021 18:35:25 -0400
X-MC-Unique: nLbKKyZAPfGZ_03F7RNIqA-1
Received: by mail-lf1-f53.google.com with SMTP id c8so4807420lfi.3
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 15:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rGLz7zH5VYaPQJm/5R2FgZ/IY8lzcUOIJsQBb/VIWM=;
	b=PHAZa5Z5m0CPp3hbPxETinSbel494/Kb4PTp90QKiLJCPzX2sWWB1jYYKVHRE+tdyK
	NS1WhDwvTu5ImptxrJg6/i0JUIMW/QxzEaEzfvymNq72jlz0Uxndy5uj9fNiHSYJUn9q
	Qij07CtmQeYH2XoMY3S8MLnlzhf02KGyZCFEniBFhorRR+lW/mJKKbbhrJiPu/kw3TcO
	qxTKoxcHfIFDJ0KsnQF9d5ZdWAmNDIHiGczwdpoEZZtQV+0IZDTcx3Z8PD4cNh5ypP2j
	XKJmueVQMC4+8+vtmqk2f1/8fltHqH8G9sYzkNSgvpHknFAEPGag108fR5L5xb1e9TdY
	/S+Q==
X-Gm-Message-State: AOAM531f34AijxN3mMPLmfxnEHGCYLdwtM9Iz4jWUtpP29LnQGZgBU0J
	ZC7qbCUbd7+m2v2SRXI5Ekw2Q1AYOr7L1DG5
X-Google-Smtp-Source: ABdhPJzkD6kZtyhU95vi7oBh9U4y7PjtH8kHlkYIJN4+W9S9ZbrLEvCos4Yrq0bhimOWYneufHiCMQ==
X-Received: by 2002:a05:6512:32c8:: with SMTP id
	f8mr8314560lfg.351.1630103723409; 
	Fri, 27 Aug 2021 15:35:23 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
	[209.85.208.182]) by smtp.gmail.com with ESMTPSA id
	p14sm708091lfa.117.2021.08.27.15.35.22 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Aug 2021 15:35:22 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id c12so14030254ljr.5
	for <cluster-devel@redhat.com>; Fri, 27 Aug 2021 15:35:22 -0700 (PDT)
X-Received: by 2002:a05:651c:908:: with SMTP id
	e8mr9500825ljq.507.1630103722494; 
	Fri, 27 Aug 2021 15:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-17-agruenba@redhat.com>
	<20210827183018.GJ12664@magnolia>
	<CAHc6FU44mGza=G4prXh08=RJZ0Wu7i6rBf53BjURj8oyX5Q8iA@mail.gmail.com>
	<20210827213239.GH12597@magnolia>
In-Reply-To: <20210827213239.GH12597@magnolia>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Aug 2021 15:35:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCCyxkk+wfDZ5bQNX62MfdprBLpy_RwpSFhFziA2Oecg@mail.gmail.com>
Message-ID: <CAHk-=whCCyxkk+wfDZ5bQNX62MfdprBLpy_RwpSFhFziA2Oecg@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 2:32 PM Darrick J. Wong <djwong@kernel.org> wrote:
>
> No, because you totally ignored the second question:
>
> If the directio operation succeeds even partially and the PARTIAL flag
> is set, won't that push the iov iter ahead by however many bytes
> completed?
>
> We already finished the IO for the first page, so the second attempt
> should pick up where it left off, i.e. the second page.

Darrick, I think you're missing the point.

It's the *return*value* that is the issue, not the iovec.

The iovec is updated as you say. But the return value from the async
part is - without Andreas' patch - only the async part of it.

With Andreas' patch, the async part will now return the full return
value, including the part that was done synchronously.

And the return value is returned from that async part, which somehow
thus needs to know what predated it.

Could that pre-existing part perhaps be saved somewhere else? Very
possibly. That 'struct iomap_dio' addition is kind of ugly. So maybe
what Andreas did could be done differently. But I think you guys are
arguing past each other.

           Linus

