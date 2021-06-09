Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD4A3A1181
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Jun 2021 12:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623235922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3O034lC9XVT1tHLr7bzKUshMkaUGECTxo1+ipe8YQ0I=;
	b=aWbjdxEsu2lQHIGtB6EgGTz2kLtzJh+kbpqltUQgWDNRF4XlqgeLvMoarveihgSG9zSCsm
	yccgv7d7BWT6AzGUwSG4hg5Ffv1WFZoFFh/lQ0OIhbwlvYE6bz3G7MyT4g6kffxsScFaf0
	KF3t1Wd/hnPy38cp+1TCDqLlpk1GwMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-dZtv6TjIMI2EJq9oc4_Vvw-1; Wed, 09 Jun 2021 06:52:01 -0400
X-MC-Unique: dZtv6TjIMI2EJq9oc4_Vvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3292101C8B1;
	Wed,  9 Jun 2021 10:51:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C93A360853;
	Wed,  9 Jun 2021 10:51:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFBA41809CAE;
	Wed,  9 Jun 2021 10:51:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 159AplRm004360 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Jun 2021 06:51:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4ABC10EB2AB; Wed,  9 Jun 2021 10:51:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C076110EB2A7
	for <cluster-devel@redhat.com>; Wed,  9 Jun 2021 10:51:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 838F280D0E1
	for <cluster-devel@redhat.com>; Wed,  9 Jun 2021 10:51:44 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-485-_oTgm9uaMgeolxeMtT9bVA-1; Wed, 09 Jun 2021 06:51:43 -0400
X-MC-Unique: _oTgm9uaMgeolxeMtT9bVA-1
Received: by mail-wr1-f69.google.com with SMTP id
	n4-20020a5d42040000b0290119fef97609so756482wrq.18
	for <cluster-devel@redhat.com>; Wed, 09 Jun 2021 03:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3O034lC9XVT1tHLr7bzKUshMkaUGECTxo1+ipe8YQ0I=;
	b=lrfFiHpDm5TGu9f41O6AxVmcVJ9ar41LZbaY1FnopGLDl3V+Fy29lO3ynszn9f+JYM
	1oK0vADp6fgCBlag0YOHlDhB6cbTvU0eVkdlwYoiM7JE+CGN0S+CUMxjjdHqk0Oezy2c
	nNoSpubzJNXuQpTdl5Bx/hooAoYuOdXiCIcgwBoXdpVF+caPed91bzFgGQXvO68jPjsF
	6R1ckwsM/AALKjrdaic7KICozx9r4inGmO+/dRbBGx+Tn/HjbwQ2Muq6v8qOB1TdHBH3
	fC2Qek9lHW3kr8b2+zVPFY82cgnCqqbUntL1WsJv2hooS9OTyLrUUBqOH69oQcWjOJJC
	4qag==
X-Gm-Message-State: AOAM531dQi2rZ1BZcQ/bDQlph5GqDykGt5sxmYDV+4g0gh1/DZiP1KC1
	RUe99c8jtFdRLdanJB2GrgsGERoNRtCqn9oNF5yDyNKlLHdtLuEvZCA68Lke5kz+7eiRsK72z/j
	jH0aYIw6RSgVbwJ9Zipugb3NeFgYMiM/8gwQI+Q==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr28687491wrs.361.1623235902149;
	Wed, 09 Jun 2021 03:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFUVH4RJ8l7mW7Wdi2mAODQQWJJNufTytgE5ne0NwBsUZTSEThQDObeBpv3G+IgXE8n9iyWpYuvMruDn6AcCA=
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr28687476wrs.361.1623235901974;
	Wed, 09 Jun 2021 03:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031244.2822705-1-libaokun1@huawei.com>
In-Reply-To: <20210608031244.2822705-1-libaokun1@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 9 Jun 2021 12:51:30 +0200
Message-ID: <CAHc6FU7yT48KaRrQt-1jn=8Cwvu9XUjfQNJC0es5cUN91Y_D=A@mail.gmail.com>
To: Baokun Li <libaokun1@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Hulk Robot <hulkci@huawei.com>, kernel-janitors@vger.kernel.org,
	yuehaibing@huawei.com, LKML <linux-kernel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, yangjihong1@huawei.com,
	weiyongjun1@huawei.com, yukuai3@huawei.com
Subject: Re: [Cluster-devel] [PATCH -next] gfs2: Use list_move_tail instead
	of list_del/list_add_tail
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 5:23 AM Baokun Li <libaokun1@huawei.com> wrote:
> Using list_move_tail() instead of list_del() + list_add_tail().

Thanks, I'll add that to for-next.

Andreas

