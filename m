Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0612C100AAF
	for <lists+cluster-devel@lfdr.de>; Mon, 18 Nov 2019 18:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574099099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VBmfxwL8SynprxOJI6ILluykOSUF4oxCnLxOnfOALko=;
	b=Igdb/+z8yGXThiOjRuirOzNXd7nE2I/5GWxtQVJzrvZbFSV9OdwJW/84STSjjpXotAVR1z
	gccyKJ9RgD70VAJJcy+rVyvaVUVOvdUDVTytk3IXT0bQ6v/FvNVvrN7dyOC1UoA+67Ifxh
	HVqDo/xSZBu/bcukdlFwZVjmVxpHOrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-Z8IZ7jSwPQCsezKTTLEkCw-1; Mon, 18 Nov 2019 12:44:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D9D800580;
	Mon, 18 Nov 2019 17:44:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E5A60561;
	Mon, 18 Nov 2019 17:44:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D36164A460;
	Mon, 18 Nov 2019 17:44:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAIHirdA027216 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 18 Nov 2019 12:44:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E26E7C4B; Mon, 18 Nov 2019 17:44:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F7153B7
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:44:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C2B0801027
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:44:51 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
	[209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-WIU5rDbMNKyGcdOlBdckpw-1; Mon, 18 Nov 2019 12:44:47 -0500
Received: by mail-oi1-f200.google.com with SMTP id s204so9103250oib.7
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VBmfxwL8SynprxOJI6ILluykOSUF4oxCnLxOnfOALko=;
	b=Tf+ozsuGfyWpDj8X/XXOn1F57k3GcGvjqhxCGMYhLfyohBTtV6zDVFJsmB5CthjjTo
	5OtmBATVwCQFgX/5Eg1s8mwYeQQ90HZMcyYoAHFPsgMLuqAH9de9NXnE1NyYZ1CELXj0
	Bf/+N4jRELIg0Mj6XqocyqbCxEFhWuZiNLTIKzVPsp9yMIRDLtF5U/zRRKjzxTByyp4V
	Eq3GtV0R5PazvZ3x3UM2J6n7G5ZYFV7ETs537kImzNLsXNtY9GIjPIOf/uvyUWNXh6MT
	OEdhy/McACk5UsNUTwKZIlIEsVHugmf1sCrM+d4BAmtpHLVIrz2xd8V9GTXhZ2JGtM8O
	ZGPg==
X-Gm-Message-State: APjAAAX/VWsDrqLgVy/1ww+0UuVoDPPPXAwb8Ruqo1t/KcNiKzSprjw0
	HJYSXxI8AwXex3HxnNt9qJ8mzNTGDXFt2QENweBGfl7LNPBGCFwNLiq+e674u0opLQVmrayK6t4
	vyUUQLYARd0g3XKY+Ec69gZnkIgtydNfAcQeAqA==
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr95249oib.101.1574099086335; 
	Mon, 18 Nov 2019 09:44:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVEWqjq3XwlMF/Ji3k8WuVrQFXbI2l5m7l/oFY+yiqjjL06To0pnbsiBSMjeJpb94Xg5hymqCffDSX0A2NK4Q=
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr95226oib.101.1574099086127; 
	Mon, 18 Nov 2019 09:44:46 -0800 (PST)
MIME-Version: 1.0
References: <1083483282.30233245.1573828936820.JavaMail.zimbra@redhat.com>
	<1945050534.30233372.1573828966829.JavaMail.zimbra@redhat.com>
In-Reply-To: <1945050534.30233372.1573828966829.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 18 Nov 2019 18:44:35 +0100
Message-ID: <CAHc6FU61W5=G6DzHW3KKqkt-vuhVecwKaCXi+-Xk1TBrD+10wQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: WIU5rDbMNKyGcdOlBdckpw-1
X-MC-Unique: Z8IZ7jSwPQCsezKTTLEkCw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAIHirdA027216
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v2] gfs2: Abort gfs2_freeze if io
 error is seen
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 3:42 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Revised to implement Andreas's suggestions.

Okay, pushed.

Thanks,
Andreas


