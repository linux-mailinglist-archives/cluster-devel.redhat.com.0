Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A88B9FD1
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Sep 2019 23:53:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4507F305883E;
	Sat, 21 Sep 2019 21:53:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA221001938;
	Sat, 21 Sep 2019 21:53:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E70CA4A486;
	Sat, 21 Sep 2019 21:53:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8LLrdQb004007 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 21 Sep 2019 17:53:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFDDD1001B32; Sat, 21 Sep 2019 21:53:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0351001B30
	for <cluster-devel@redhat.com>; Sat, 21 Sep 2019 21:53:37 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81E8336955
	for <cluster-devel@redhat.com>; Sat, 21 Sep 2019 21:53:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r134so7403440lff.12
	for <cluster-devel@redhat.com>; Sat, 21 Sep 2019 14:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DW/BK8ZK0TozLxFXsqg0nu8i7JK595n1bh3U/VvGWUs=;
	b=f2+XkDrcuEAeuQ8N4GTGxDiNBU6o8EdjfLIq8mGWA8mKJnIhcMAOiBgXMKCUnvh1iE
	l7iO5O3vQBBSVv0wTjh7xQ84T2I8+7r8qPG9l0l6K0Sn3vSg/zoHf5odQdBeZHB5VLRq
	BZDSNctOxKcwYCrnr6AiJEhHRY0KRvbYMKpLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DW/BK8ZK0TozLxFXsqg0nu8i7JK595n1bh3U/VvGWUs=;
	b=Ts/xjsLUUKWKy2RMNy5sh/0KHSC83iDKGJdlcvD5m7tcExRs0G3uR7e3ss/tZBIqZ5
	xOExvForfdLndA3ghNVHjVvaLqT27yj6U3h9jLgQWACPlQHFBQ04POr7fXLDT4Y+5YOi
	wzTevVZNgIIkVjW9HnIrqD3BUauRCDc34L+NkIyKB6REl+27vY3SkXzDUoJchFHAh7LE
	W5FTUu1rueLvUbksU7gzUaWf7to4xQgFsl9BmK8BIVweMhOnENnTwMZxDTcF2gUJTUq9
	KRr+MQ6cr39CKZwg56Q304/ZKbf432xlZ6t09GgLgjqtwkJhQEg8OVEgsqslhq5CHEEl
	HB0g==
X-Gm-Message-State: APjAAAWcdb/tx9gxuNN/0SS0xGf1H+yWwedmT9/wnHag3s1AItbEuqIe
	fy6nnuVDWuXSL+1cpgQL4Xn+wPIrTfs=
X-Google-Smtp-Source: APXvYqxKmpMhvNm8ixHM8Zf5ylox0KdZZ4QdLPM7p05LpkxFvo0kqlgWPF0uSJPwcNBI61AwWiwDEw==
X-Received: by 2002:a05:6512:4dd:: with SMTP id
	w29mr12223098lfq.2.1569102814573; 
	Sat, 21 Sep 2019 14:53:34 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
	[209.85.208.171]) by smtp.gmail.com with ESMTPSA id
	w30sm1283762lfn.82.2019.09.21.14.53.33 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 21 Sep 2019 14:53:33 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id q64so10183812ljb.12
	for <cluster-devel@redhat.com>; Sat, 21 Sep 2019 14:53:33 -0700 (PDT)
X-Received: by 2002:a2e:3e07:: with SMTP id l7mr12873772lja.180.1569102813417; 
	Sat, 21 Sep 2019 14:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190921165126.4443-1-agruenba@redhat.com>
In-Reply-To: <20190921165126.4443-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Sep 2019 14:53:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whA0x5DLX14=hdAq4SukTs7WXsrNyLuqwiFbXJyYnmBcQ@mail.gmail.com>
Message-ID: <CAHk-=whA0x5DLX14=hdAq4SukTs7WXsrNyLuqwiFbXJyYnmBcQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 21 Sep 2019 21:53:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sat, 21 Sep 2019 21:53:36 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: 0.148  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 changes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 21 Sep 2019 21:53:49 +0000 (UTC)

On Sat, Sep 21, 2019 at 9:51 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> please consider pulling the following changes for gfs2.

Merged.

But I notice that you're not getting any pr-tracker replies.

I'd suggest you cc lkml to get the automatic notification in case you care,

                 Linus

