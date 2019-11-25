Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3583C108A9D
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Nov 2019 10:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574673380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vQpBxa+sbwDhmpEbL2gQL/bvQxnet+rjf5pFA9CqWG4=;
	b=WFhQ5K8K1sNQ5B3VhP6pOv02EJt2W6KRL3uvrASWMdSkt9taU3BEOUSsrAGLA7qaazCHYd
	ux9AndYlEYZm0V3KotRVdxMgHJWQZCYvmq8JlGuS+CM6K/Nyqqto7fnM6bwNKy2Q3gh4GW
	g16zvplW8+rrcZqleT+WGU+ddu3PUaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-UdvrCn4YPsSQyITWRMy6Gg-1; Mon, 25 Nov 2019 04:16:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50CC918B5FBB;
	Mon, 25 Nov 2019 09:16:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4632F19C69;
	Mon, 25 Nov 2019 09:16:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1A7218089CE;
	Mon, 25 Nov 2019 09:16:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAP9F9Lc008482 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 04:15:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3283D10DCF4C; Mon, 25 Nov 2019 09:15:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E1F710E60F3
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:15:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B8E6905B51
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 09:15:06 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-vqucPw2DP_WKEosjtounCQ-1; Mon, 25 Nov 2019 04:15:02 -0500
Received: by mail-lj1-f194.google.com with SMTP id m4so14882708ljj.8
	for <cluster-devel@redhat.com>; Mon, 25 Nov 2019 01:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FcfAwDLFSNgmDLyFmP3mnRn5XPVP/dHuo5ueDN07hL8=;
	b=LV6UDnM9j59wJSB6dQnlzBSykJcRWb6jznifrFf9RPuP7YI4o98zqOHKcs1AdvDwTR
	PECy4CtxhDsgdtajdeApetAocoxNGPZBn/ObbUjemukH/mL07JLaTkPV7p/KGc6UlDih
	S25twp1pSKpb+T6jvZHpiFrubd4DNxbX+zksTm/Fzd09M2QZ6eLE1OJMAFcQyL2RmxDY
	IqSB6FCCodWZZFbHy5u6S2osrf6v/jxh3cny1HrN+yRU1/sTEAHArKV/vvkzK8Obt1HY
	VXfS/qbin58GYYhMdJwIJOd5S9RuQRrUy8yzWxwgf4hs2PEZwObpMyR5THCmh5vTqzQe
	YmhQ==
X-Gm-Message-State: APjAAAVBosD4BUWQ0DM4JbsEh2+hAETStJ+DoPg+UV9LiNPL//eYuDpt
	CnMKcKrQHlQ33j17YQUZUFYSJQ==
X-Google-Smtp-Source: APXvYqx3omxBvBBPAeuC2qvJocDKxfyY/bfPA/SuPulk3OiGBBrujyPNMsYgSAQTEVKepMR1D/JfQg==
X-Received: by 2002:a2e:9695:: with SMTP id q21mr20770656lji.206.1574673300853;
	Mon, 25 Nov 2019 01:15:00 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
	by smtp.gmail.com with ESMTPSA id q21sm3267727lfo.4.2019.11.25.01.14.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 01:14:59 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id CA1C11032C4; Mon, 25 Nov 2019 12:15:08 +0300 (+03)
Date: Mon, 25 Nov 2019 12:15:08 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191125091508.3265wtfzpoupv2lj@box>
References: <20191122235324.17245-1-agruenba@redhat.com>
	<20191122235324.17245-4-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122235324.17245-4-agruenba@redhat.com>
User-Agent: NeoMutt/20180716
X-MC-Unique: vqucPw2DP_WKEosjtounCQ-1
X-MC-Unique: UdvrCn4YPsSQyITWRMy6Gg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAP9F9Lc008482
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 04:16:06 -0500
Cc: Steve French <sfrench@samba.org>,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-kernel@vger.kernel.org,
	Ronnie Sahlberg <lsahlber@redhat.com>, cluster-devel@redhat.com,
	linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Cluster-devel] [RFC PATCH 3/3] gfs2: Rework read and page
	fault locking
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, Nov 23, 2019 at 12:53:24AM +0100, Andreas Gruenbacher wrote:
> @@ -778,15 +804,51 @@ static ssize_t gfs2_file_direct_write(struct kiocb =
*iocb, struct iov_iter *from)
> =20
>  static ssize_t gfs2_file_read_iter(struct kiocb *iocb, struct iov_iter *=
to)
>  {
> +=09struct gfs2_inode *ip;
> +=09struct gfs2_holder gh;
> +=09size_t written =3D 0;

'written' in a read routine?

--=20
 Kirill A. Shutemov


