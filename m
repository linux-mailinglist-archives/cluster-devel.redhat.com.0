Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 355372C0C9D
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Nov 2020 15:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606140661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
	b=coQ3Hzzkp4W2yDlSNt98bnPKhc8+c4gCVGeNB52rDApkiWXsq6AxgNsHxfLhxTfjLcgPSe
	QMm6jPFFTae8E/HGY7ZMXlPJUateODoN+wkY+p97hrDIKFpFNfZoPrfM8dKkSkbvFZXeKv
	aHR69RamHmSGlAMs2KwfsTbVb/I63bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-dKjMgS84PsO2tzei_MaUGQ-1; Mon, 23 Nov 2020 09:10:58 -0500
X-MC-Unique: dKjMgS84PsO2tzei_MaUGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFFC8809DE0;
	Mon, 23 Nov 2020 14:10:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA6419D7C;
	Mon, 23 Nov 2020 14:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AD2D1D8D;
	Mon, 23 Nov 2020 14:02:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AMEkuXH006849 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 22 Nov 2020 09:46:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D99632026D13; Sun, 22 Nov 2020 14:46:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BDD2026D11
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 14:46:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7069D103B800
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 14:46:54 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-336-XjSJdX_SOgagO0xhjEhxnA-1; Sun, 22 Nov 2020 09:46:52 -0500
X-MC-Unique: XjSJdX_SOgagO0xhjEhxnA-1
Received: by mail-qk1-f200.google.com with SMTP id t141so12539508qke.22
	for <cluster-devel@redhat.com>; Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
	b=Ep9AHF+6sHY24iSmZ86MgQER+q6A6cm4mMIj2RxHYjWHEBNRZ7KiXb7+HVr/qGvLRI
	OOrkpVGwFnFJBXJE4SKBvYD5i5gV41kyYNmyhEWO8TWS/KE8dz+LUOT54/kK73z3zopn
	12i4o+9hT3dcN2wgk0MKV50akJXTJXXNp3cA08XGP6PLbyr+Efie2cD2bd9+fNo8iA7+
	skpGLPPL/sroSjU5O+4jkEVuHvDbWyMwtaXXA2T3Rx1qtlveTS8C7e/bgoEv1JYhjNa7
	tz00J+mrcduQAZDxh7LGQ5Xk/i7lp0LgeYl4M7pOjblIgxYIpSzkkNt3rXwvbKOK14bm
	8wWA==
X-Gm-Message-State: AOAM532tbc4iY5A9jyX2me4N/1cGq9mKcKeA5UCCgtb2XDxgl6vFXwfC
	2P2z/RYMUj71Cbdhu/ahEdeN3662+NUKxjYNU5VWh8MiYgMfBk9tGdZoCciGpM+dOr+C1r1gn/L
	a/Q0m7N4I0dgQJfBKoQeThQ==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026166qvx.57.1606056412428; 
	Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPQ8vJIBgyJxmgPlUVzOaStXFRaD0Z+d8VDmnR7kdLyNkvwByAGPov006wc7+pJBCcgj+/zw==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026152qvx.57.1606056412222; 
	Sun, 22 Nov 2020 06:46:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
	[75.142.250.213]) by smtp.gmail.com with ESMTPSA id
	x72sm6888242qkb.90.2020.11.22.06.46.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 22 Nov 2020 06:46:51 -0800 (PST)
To: Matthew Wilcox <willy@infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
	<20201122032304.GE4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
Date: Sun, 22 Nov 2020 06:46:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122032304.GE4327@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:02:28 -0500
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	coreteam@netfilter.org, xen-devel@lists.xenproject.org,
	MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
	alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-omap@vger.kernel.org, devel@acpica.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, joe@perches.com, bpf@vger.kernel.org
Subject: Re: [Cluster-devel] [RFC] MAINTAINERS tag for cleanup robot
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>> The fixer review is
>> https://reviews.llvm.org/D91789
>>
>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>> The false positives are caused by macros passed to other macros and by
>> some macro expansions that did not have an extra semicolon.
>>
>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>> warnings in linux-next.
> Are any of them not false-positives?  It's all very well to enable
> stricter warnings, but if they don't fix any bugs, they're just churn.
>
While enabling additional warnings may be a side effect of this effort

the primary goal is to set up a cleaning robot. After that a refactoring robot.

Tom

