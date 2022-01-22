Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118C496D47
	for <lists+cluster-devel@lfdr.de>; Sat, 22 Jan 2022 19:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642876135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ucv0aOeTl0qY0LIW0rR1qOQJXa96wvP2HU03hO2vqUI=;
	b=Su0sA7V4CuQcmimWQxPZsTJsxhNzspIzQABDwaoRlqiQnpulC4IUFWjMdFpXeauy/hscnR
	c22z+RMXojthC1o1SZKPagHSD8rAH7knU9Xp+2nOkDBRM8m1wU+t/PdHRRyqLb0vqXFqIE
	JpKLBIBrCWlEnkxQSiiiH2EZ7EOtZg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-C9nWIdtzP0GxaVXyuILY8A-1; Sat, 22 Jan 2022 13:28:51 -0500
X-MC-Unique: C9nWIdtzP0GxaVXyuILY8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 192FD814243;
	Sat, 22 Jan 2022 18:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FEE838CA;
	Sat, 22 Jan 2022 18:28:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D3FB1809CB8;
	Sat, 22 Jan 2022 18:28:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20MISae2031850 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 22 Jan 2022 13:28:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C867E2026D65; Sat, 22 Jan 2022 18:28:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C408D2026D64
	for <cluster-devel@redhat.com>; Sat, 22 Jan 2022 18:28:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6E671C05EA6
	for <cluster-devel@redhat.com>; Sat, 22 Jan 2022 18:28:33 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-613-hXo4TElyMoC9_-lnuyKXCw-1; Sat, 22 Jan 2022 13:28:32 -0500
X-MC-Unique: hXo4TElyMoC9_-lnuyKXCw-1
Received: by mail-qt1-f199.google.com with SMTP id
	d21-20020ac84e35000000b002cef6dff037so628205qtw.23
	for <cluster-devel@redhat.com>; Sat, 22 Jan 2022 10:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ucv0aOeTl0qY0LIW0rR1qOQJXa96wvP2HU03hO2vqUI=;
	b=AwyVjC5VILnHo0XgVtxxFp4IdKa2rMViAfNEkD0/PDiJ81TKSgLqfHqAx0u9ybUKsW
	gxH+o273XP5ps6rgjxw1Yd8VAbJGvszWhrcxvT0nV2OOE2s5mUtmLTqQs6/EwwsXZXbI
	xZWkpk1D2iALkLGKMfdKz/JADi4eT9VdXZrnLZGTtFXQwd4cwtqViNXlHgbS5+Ua7dQp
	zv6SLufxGFbwKAASssI+P1Ot9cJYrgNMqLAsMXWU2lhGSoE9nu5AexSIc+qG6lz+tjER
	HYp6sZjZTkeoKN1ycUvh0o7PpWqQ0KK4bHbeGw+zpJ7uARSaDRN+4PM5XTtFuPcXZgiY
	C0aQ==
X-Gm-Message-State: AOAM5308KhpPpsHr30eWbHXhmdcDrvOF0FFE/SX/SZXywwbqNbiejFum
	dz869f+3WRPhEK9awMwZq3LtD/kU7ZVesqlFQASpfzJS/l+obbIHITSI7guft5u7APegq1pu/qh
	+sCJ1t7q+ZhGB5pdA2wbAqZzTuGnzpfPuE22ipg==
X-Received: by 2002:a05:622a:154:: with SMTP id
	v20mr7424959qtw.291.1642876111880; 
	Sat, 22 Jan 2022 10:28:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIoGUAu6bpFbODt3HNOc9I4zp+34EQICGP/ho2BjV+qObmlj30UPR4WKnhMWKC4nAp+ZQQuSoZ2A3Y9UpV0qs=
X-Received: by 2002:a05:622a:154:: with SMTP id
	v20mr7424947qtw.291.1642876111635; 
	Sat, 22 Jan 2022 10:28:31 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com>
In-Reply-To: <202201221028.YKA8kSdm-lkp@intel.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Sat, 22 Jan 2022 13:28:20 -0500
Message-ID: <CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] fs/dlm/midcomms.c:913:22: sparse: sparse:
 restricted __le32 degrades to integer
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

On Fri, Jan 21, 2022 at 9:45 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9b57f458985742bd1c585f4c7f36d04634ce1143
> commit: 658bd576f95ed597e519cdadf1c86ac87c17aea5 fs: dlm: move version conversion to compile time
> date:   3 months ago
> config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20220122/202201221028.YKA8kSdm-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=658bd576f95ed597e519cdadf1c86ac87c17aea5
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 658bd576f95ed597e519cdadf1c86ac87c17aea5
>         # save the config file to linux build tree
>         mkdir build_dir
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate

I have it on my list but it isn't easy to make sparse happy here...
this is the second time the robot reported this issue. Is there a way
to turn the robot off in that case?

Maybe some human who reads that knows the answer?

Thanks.

- Alex

