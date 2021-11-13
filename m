Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6B44F02E
	for <lists+cluster-devel@lfdr.de>; Sat, 13 Nov 2021 01:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636762125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eXiLFu/hrnsJ38NrvPQMk767kJTQH5PjHJ/nzJYWid0=;
	b=chxc6ucjoCA/SZb+0jAkw5kYbw3OuFhiRNtSOW9V9enilg2emGai3lyZOGd0nyO36PExgU
	NbZNxv3gEzvjTvfBhMOQlVynEupYsPkvFFz91X5/nn2q9ON7nope83MrFTpSsLFn1ImJ0o
	AyP5LqiHfjJb/prZXbRXAR/+yP5+qJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-bD4NMf0QOwGmApNij0lHLQ-1; Fri, 12 Nov 2021 19:08:42 -0500
X-MC-Unique: bD4NMf0QOwGmApNij0lHLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ECFC824F8D;
	Sat, 13 Nov 2021 00:08:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CF15C1B4;
	Sat, 13 Nov 2021 00:08:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB475181A1CF;
	Sat, 13 Nov 2021 00:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AD08TjZ030767 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 19:08:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72AA3404727D; Sat, 13 Nov 2021 00:08:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ED92404727C
	for <cluster-devel@redhat.com>; Sat, 13 Nov 2021 00:08:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53DB11066559
	for <cluster-devel@redhat.com>; Sat, 13 Nov 2021 00:08:29 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-384-mWi3on3DOrqFABQVsLXAOA-1; Fri, 12 Nov 2021 19:08:28 -0500
X-MC-Unique: mWi3on3DOrqFABQVsLXAOA-1
Received: by mail-qv1-f69.google.com with SMTP id
	g12-20020a0562141ccc00b003c0322ea7b6so4056732qvd.19
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 16:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eXiLFu/hrnsJ38NrvPQMk767kJTQH5PjHJ/nzJYWid0=;
	b=X0YALglPd4DkUA989OXX+d12pvzmshMfgU9xIyaTUxTeqAInoeOKhIebMiAlG0zrMR
	chhGZu+vm6B8HxCCM23Cv1nurdA1MWcdnw5yM2M+LPEUtvBUUYYuXx20p+njEuyzTAgD
	ayGMpp2BxpehPMgV+k+3gpC2Bn8j8Hu2hIepwBrzxyqCWBrKhXcXWcpXCTexDh/9Ckno
	sX2f35qHvE4JjPzWPE9ImeADyQAfK6COmvjW3UzHnRSUOWvLQzA2Ubh9zJUyxgW2Ue48
	48V4bqN9Wmkk/+ShP9yuvmm7LnfUU4K1Z9Hjk0rOaYXh53ykUEMncGMw01W4cqDVnQD9
	0ZuQ==
X-Gm-Message-State: AOAM532BpoUDWxOr/Y+Ouy59Ae0ZaOliW4NSQFK2KXo8sz1OVbDsRpCT
	Gq2jmAjOkmz0lzdzgRmCJBnLUiJ5m6bJoweOnA7CULkJOKr/zUPfKYqcKoqjDxn2aHEBnBi9oNd
	spKtsJzh+oeZ1mUXPkaGMb4K+0EWZITB78HsVtA==
X-Received: by 2002:a05:620a:2403:: with SMTP id
	d3mr15529314qkn.281.1636762107638; 
	Fri, 12 Nov 2021 16:08:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0UN8EruVR6Z63nfe/beqkWWDy0CSiPF6Mezx4s5pyOaxekEHPoPQOA1Kmi+39ELlprfdbRvd35oy/Dfa94zo=
X-Received: by 2002:a05:620a:2403:: with SMTP id
	d3mr15529295qkn.281.1636762107493; 
	Fri, 12 Nov 2021 16:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20211112220240.1695712-1-aahringo@redhat.com>
In-Reply-To: <20211112220240.1695712-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 12 Nov 2021 19:08:16 -0500
Message-ID: <CAK-6q+gShwv7ViStALYySnprsdgrQHCJ1FyoTEkWpwAP7CXECQ@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm-next 1/2] fs: dlm: don't call
	kernel_getpeername() in error_report()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Nov 12, 2021 at 5:03 PM Alexander Aring <aahringo@redhat.com> wrote:
...
>
> It is and was always forbidden to call kernel_getpeername() in context
> of error_report(). To get rid of the problem we save the peer address in
> the connection struct and access it in error_report() without using
> kernel_getpeername() in this context.
>

I will send a v2, this can be improved by using inet_sk().

- Alex

